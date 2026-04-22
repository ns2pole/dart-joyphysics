import 'dart:html' as html;
import 'user_agent_stores_types.dart';

/// Detects iOS / Android from [window.navigator.userAgent] (best effort).
WebStoreClientHint webStoreClientHint() {
  final ua = html.window.navigator.userAgent.toLowerCase();
  final mtp = html.window.navigator.maxTouchPoints;
  if (ua.contains('iphone') ||
      ua.contains('ipad') ||
      ua.contains('ipod') ||
      (ua.contains('macintosh') && mtp != null && mtp > 1)) {
    return WebStoreClientHint.ios;
  }
  if (ua.contains('android')) {
    return WebStoreClientHint.android;
  }
  return WebStoreClientHint.unknown;
}
