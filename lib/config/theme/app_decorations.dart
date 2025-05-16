import 'package:flutter/material.dart';

import 'app_dimensions.dart';

class AppDecorations {
  static ShapeBorder get cardRounded => RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kSize20)));

  static BorderRadius radiusVertical({double? top, double? bottom}) => BorderRadius.vertical(
    top: top == null ? Radius.zero : Radius.circular(top),
    bottom: bottom == null ? Radius.zero : Radius.circular(bottom),
  );
}
