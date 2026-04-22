import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:joyphysics/joy_physics_store_uris.dart';
import 'package:joyphysics/experiment/user_agent_stores.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showSensorAppStoreDialog(
  BuildContext context, {
  String title = 'アプリ版で測定できます',
  String message = 'Web版のこの画面では、端末のセンサーで本番測定できません。アプリをインストールしてフル体験してください。',
}) async {
  if (!kIsWeb) return;
  final hint = webStoreClientHint();
  if (!context.mounted) return;
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        if (hint == WebStoreClientHint.ios || hint == WebStoreClientHint.unknown)
          TextButton.icon(
            onPressed: () {
              launchUrl(
                JoyPhysicsStoreUris.appStore,
                webOnlyWindowName: '_blank',
              );
            },
            icon: const Icon(Icons.apple),
            label: const Text('App Store'),
          ),
        if (hint == WebStoreClientHint.android ||
            hint == WebStoreClientHint.unknown)
          TextButton.icon(
            onPressed: () {
              launchUrl(
                JoyPhysicsStoreUris.googlePlay,
                webOnlyWindowName: '_blank',
              );
            },
            icon: const Icon(Icons.android),
            label: const Text('Google Play'),
          ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('閉じる'),
        ),
      ],
    ),
  );
}
