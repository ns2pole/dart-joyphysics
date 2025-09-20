import 'dart:io' show Platform; // <- 追加
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ------------------- UpdateChecker クラス -------------------
class UpdateChecker {
  final String iosId;
  final String androidId;
  final int skipDays;
  final String title;
  final String message;
  final String laterText;
  final String updateText;

  // ユーザーが「他は変えないでね」と言っていたので、
  // ここではインスタンス保持の navigatorKey をそのまま置いています。
  // （MaterialApp 側でこれを使う場合は外側で同じ key を渡す必要があります）
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  UpdateChecker({
    required this.iosId,
    required this.androidId,
    this.skipDays = 3,
    this.title = "新しいアップデートがあります",
    this.message = "更新してみませんか？",
    this.laterText = "あとで",
    this.updateText = "更新する",
  });

  /// 1行で起動時に呼ぶだけでチェック開始
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

    // 前回表示日を確認
    final lastShownMillis = prefs.getInt("last_update_prompt_millis");
    debugPrint('[UpdateChecker] lastShownMillis = $lastShownMillis, skipDays = $skipDays, today = $today');

    if (lastShownMillis != null) {
      final lastShown = DateTime.fromMillisecondsSinceEpoch(lastShownMillis);
      debugPrint('[UpdateChecker] lastShown = $lastShown');
      if (today.difference(lastShown).inDays < skipDays) {
        debugPrint('[UpdateChecker] skipping check: within skipDays');
        return;
      }
    }

    final newVersion = NewVersionPlus(
      iOSId: iosId,
      androidId: androidId,
    );

    try {
      debugPrint('[UpdateChecker] calling getVersionStatus() ...');
      final status = await newVersion.getVersionStatus();
      debugPrint('[UpdateChecker] getVersionStatus() returned: $status');

      if (status == null) {
        debugPrint('[UpdateChecker] status == null -> no info from store');
        return;
      }

      // status の中身を詳しく出す（デバッグ確認用）
      debugPrint('[UpdateChecker] canUpdate: ${status.canUpdate}');
      debugPrint('[UpdateChecker] localVersion: ${status.localVersion}');
      debugPrint('[UpdateChecker] storeVersion: ${status.storeVersion}');
      debugPrint('[UpdateChecker] appStoreLink: ${status.appStoreLink}');
      debugPrint('[UpdateChecker] releaseNotes: ${status.releaseNotes}');

      if (status.canUpdate) {
        debugPrint('[UpdateChecker] update available -> show dialog');
        _showUpdateDialog(newVersion, prefs);
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

  void _showUpdateDialog(NewVersionPlus newVersion, SharedPreferences prefs) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint('[UpdateChecker] _showUpdateDialog: context is null, cannot show dialog');
      return;
    }

    debugPrint('[UpdateChecker] _showUpdateDialog: showing AlertDialog');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(laterText),
            onPressed: () async {
              debugPrint('[UpdateChecker] user pressed: $laterText');
              await prefs.setInt(
                "last_update_prompt_millis",
                DateTime.now().millisecondsSinceEpoch,
              );
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(updateText),
            onPressed: () {
              debugPrint('[UpdateChecker] user pressed: $updateText');
              Navigator.of(context).pop();

              // new_version_plus 0.1.1 の場合は位置引数で appId を1つ渡す仕様
              final appId = Platform.isIOS ? iosId : androidId;
              debugPrint('[UpdateChecker] launching app store with appId=$appId');

              try {
                newVersion.launchAppStore(appId);
              } catch (e, st) {
                debugPrint('[UpdateChecker] launchAppStore error: $e');
                debugPrint(st.toString());
                // ここで必要なら status.appStoreLink を使って url_launcher で開くなどのフォールバックを検討
              }
            },
          ),
        ],
      ),
    );
  }
}
