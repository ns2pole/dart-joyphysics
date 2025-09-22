// lib/utils/update_checker.dart
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// UpdateChecker
/// - navigatorKey: MaterialApp に渡している GlobalKey<NavigatorState> をそのまま渡すこと
/// - forceShowForDebug: true にするとストア情報が無くてもダイアログを出します（開発用）
class UpdateChecker {
  final String iosId;
  final String androidId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int skipDays;
  final String title;
  final String message;
  final String laterText;
  final String updateText;
  final bool forceShowForDebug;

  /// 内部設定（リトライ回数・待ち時間）-- 必要なら調整可能
  final int _maxRetries;
  final Duration _retryDelay;

  UpdateChecker({
    required this.iosId,
    required this.androidId,
    required this.navigatorKey,
    this.skipDays = 3,
    this.title = "新しいアップデートがあります",
    this.message = "更新してみませんか？",
    this.laterText = "あとで",
    this.updateText = "更新する",
    this.forceShowForDebug = false,
    int maxRetries = 10,
    Duration retryDelay = const Duration(milliseconds: 200),
  })  : _maxRetries = maxRetries,
        _retryDelay = retryDelay;

  /// アプリ起動時に一度呼ぶ想定。WidgetsBinding.instance.addPostFrameCallback の内外どちらでも可。
  void checkOnAppStart() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint('[UpdateChecker] checkOnAppStart: called');
      try {
        await _checkAndShowDialog();
      } catch (e, st) {
        debugPrint('[UpdateChecker] checkOnAppStart: error -> $e');
        debugPrint(st.toString());
      }
      debugPrint('[UpdateChecker] checkOnAppStart: done');
    });
  }

  Future<void> _checkAndShowDialog() async {
    debugPrint('[UpdateChecker] _checkAndShowDialog: start');
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();

    // 前回表示日確認（ただしデバッグ強制表示時は無視）
    final lastShownMillis = prefs.getInt("last_update_prompt_millis");
    debugPrint('[UpdateChecker] lastShownMillis = $lastShownMillis, skipDays = $skipDays, today = $today');

    if (lastShownMillis != null && !forceShowForDebug) {
      final lastShown = DateTime.fromMillisecondsSinceEpoch(lastShownMillis);
      debugPrint('[UpdateChecker] lastShown = $lastShown');
      if (today.difference(lastShown).inDays < skipDays) {
        debugPrint('[UpdateChecker] skipping check: within skipDays');
        return;
      }
    }

    final newVersion = NewVersionPlus(iOSId: iosId, androidId: androidId);

    try {
      debugPrint('[UpdateChecker] calling getVersionStatus() ...');
      final status = await newVersion.getVersionStatus();
      debugPrint('[UpdateChecker] getVersionStatus() returned: $status');

      if (status == null) {
        debugPrint('[UpdateChecker] status == null -> no store info');
        if (forceShowForDebug) {
          debugPrint('[UpdateChecker] forceShowForDebug is true -> showing debug dialog');
          // 擬似ステータス情報でダイアログ表示（storeVersion を示すなど）
          await _ensureContextAndShowDialog(newVersion, prefs, fakeStoreVersion: 'dev-test');
        }
        return;
      }

      debugPrint('[UpdateChecker] canUpdate: ${status.canUpdate}');
      debugPrint('[UpdateChecker] localVersion: ${status.localVersion}');
      debugPrint('[UpdateChecker] storeVersion: ${status.storeVersion}');
      debugPrint('[UpdateChecker] appStoreLink: ${status.appStoreLink}');
      debugPrint('[UpdateChecker] releaseNotes: ${status.releaseNotes}');

      if (status.canUpdate || forceShowForDebug) {
        debugPrint('[UpdateChecker] update available or forced -> show dialog');
        await _ensureContextAndShowDialog(newVersion, prefs, status: status);
      } else {
        debugPrint('[UpdateChecker] no update available');
      }
    } catch (e, st) {
      debugPrint('[UpdateChecker] getVersionStatus error: $e');
      debugPrint(st.toString());
    } finally {
      debugPrint('[UpdateChecker] _checkAndShowDialog: exit');
    }
  }

  /// context が取れるまでリトライしてダイアログを表示する
  Future<void> _ensureContextAndShowDialog(
    NewVersionPlus newVersion,
    SharedPreferences prefs, {
    VersionStatus? status,
    String? fakeStoreVersion,
  }) async {
    int tries = 0;
    while (tries < _maxRetries) {
      final context = navigatorKey.currentContext;
      if (context != null) {
        debugPrint('[UpdateChecker] context available after $tries tries');
        _showUpdateDialog(newVersion, prefs, context, status: status, fakeStoreVersion: fakeStoreVersion);
        return;
      }
      tries++;
      debugPrint('[UpdateChecker] waiting for context... try=$tries');
      await Future.delayed(_retryDelay);
    }
    debugPrint('[UpdateChecker] context still null after $_maxRetries tries; abort showing dialog');
  }

  void _showUpdateDialog(
    NewVersionPlus newVersion,
    SharedPreferences prefs,
    BuildContext context, {
    VersionStatus? status,
    String? fakeStoreVersion,
  }) {
    debugPrint('[UpdateChecker] _showUpdateDialog: showing AlertDialog');
    final storeInfo = status?.storeVersion ?? fakeStoreVersion;
    final releaseNotes = status?.releaseNotes ?? '';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            if (storeInfo != null) ...[
              const SizedBox(height: 8),
              Text('Store version: $storeInfo', style: const TextStyle(fontSize: 12)),
            ],
            if (releaseNotes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('更新内容: $releaseNotes', style: const TextStyle(fontSize: 12)),
            ],
          ],
        ),
        actions: [
          TextButton(
            child: Text(laterText),
            onPressed: () async {
              debugPrint('[UpdateChecker] user pressed: $laterText');
              await prefs.setInt("last_update_prompt_millis", DateTime.now().millisecondsSinceEpoch);
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text(updateText),
            onPressed: () async {
              debugPrint('[UpdateChecker] user pressed: $updateText');
              Navigator.of(ctx).pop();

              final appId = Platform.isIOS ? iosId : androidId;
              debugPrint('[UpdateChecker] launching app store with appId=$appId');

              try {
                // new_version_plus のバージョンにより呼び出しが異なる場合があるので例外処理でキャッチ
                await newVersion.launchAppStore(appId);
              } catch (e, st) {
                debugPrint('[UpdateChecker] launchAppStore error: $e');
                debugPrint(st.toString());
                // フォールバック案: status?.appStoreLink を url_launcher で開く（url_launcher を導入する場合）
                // if (status?.appStoreLink != null) await launchUrlString(status!.appStoreLink!);
              }
            },
          ),
        ],
      ),
    );
  }
}
