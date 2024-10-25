import 'dart:ui';

extension HexColorExt on String {
  Color get toColor =>
      Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
}
