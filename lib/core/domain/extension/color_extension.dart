import 'package:flutter/material.dart';

extension ColorOpacity on Color {
  Color withOpacityValue(double opacity) {
    assert(opacity >= 0 && opacity <= 1, 'The opacity value must be between 0 and 1');

    int alpha = (opacity * 255).toInt();
    int rgb = toARGB32() & 0x00FFFFFF;

    return Color((alpha << 24) | rgb);
  }
}
