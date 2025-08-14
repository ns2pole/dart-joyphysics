import 'package:flutter/material.dart';
// 色コードからColor生成拡張
extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    String hex = hexString.replaceFirst('#', '');
    if (hex.length == 3) {
      // RGB (12-bit)
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) buffer.write('ff');
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}