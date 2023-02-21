import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray700 = fromHex('#666666');
  static Color indigoA400 = fromHex('#3563e9');
  static Color bluegray100 = fromHex('#d9d9d9');
  static Color bluegray200 = fromHex('#aaaaaa');
  static Color black900 = fromHex('#000000');
  static Color lightBlueA700 = fromHex('#0194e6');

  static Color bluegray400 = fromHex('#888888');

  static Color gray900 = fromHex('#1d222d');
  static Color whiteA7007f = fromHex('#7fffffff');
  static Color gray500C4 = fromHex('#c4999999');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50 = fromHex('#f8f8f8');
  static Color blueA100 = fromHex('#85a8f8');
  static Color gray100 = fromHex('#eff3fd');
  static Color red400 = fromHex('#e86060');
  static Color indigo200 = fromHex('#87a4da');
  static Color primaryBackground = fromHex('#F8FAFD');

  static Color primaryText = fromHex('#1D232E');

  static Color bluegray700 = fromHex('#535763');

  static Color deepPurpleA200 = fromHex('#6759ff');

  static Color gray200 = fromHex('#f0f0f0');

  static Color indigo900 = fromHex('#00215f');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color blue600 = fromHex('#0c77f5');

  static Color red300 = fromHex('#FF0000');

  static Color indigo8004c = fromHex('#4c243a82');

  static Color green500 = fromHex('#33ad69');

  static Color indigo8007a = fromHex('#7a243a82');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color gray50099 = fromHex('#999d9d9d');

  static Color indigo80099 = fromHex('#99243a82');

  static Color blue100 = fromHex('#b7d4ff');

  static Color indigo800 = fromHex('#243a82');

  static Color lightGreen500 = fromHex('#76ee59');

  static Color gray9007a = fromHex('#7a1d232e');

  static Color green800 = fromHex('#01ad08');

  static Color whiteA70033 = fromHex('#33ffffff');
  static Color whiteA7003 = fromHex('#ffffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
