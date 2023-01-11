import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black90001 = fromHex('#000000');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color black900 = fromHex('#0c0c0c');

  static Color bluegray400 = fromHex('#888888');

  static Color black9007c = fromHex('#7c000000');

  static Color black901 = fromHex('#000000');

  static Color red300 = fromHex('#da7c7c');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
