import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/share/widgets/searchBar/organisms/ios/search_bar_ios.dart';

import 'organisms/android/search_bar_android.dart';

class CustomSearchBar<T> extends StatelessWidget {
  final String hintText;
  final T backgroundColor;
  final WidgetStatePropertyAll<double>? elevation;
  final TextEditingController controllerSearch;
  final void Function(String) onSearchChanged;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    this.elevation,
    required this.controllerSearch,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return SearchBarIos(
        hintText: hintText,
        backgroundColor: _convertToColor(backgroundColor),
        controllerSearch: controllerSearch,
        onSearchChanged: onSearchChanged,
      );
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return SearchBarAndroid(
        hintText: hintText,
        backgroundColor: _convertToWidgetStateProperty(backgroundColor),
        controllerSearch: controllerSearch,
        onSearchChanged: onSearchChanged,
      );
    } else {
      return SearchBarAndroid(
        hintText: hintText,
        backgroundColor: _convertToWidgetStateProperty(backgroundColor),
        controllerSearch: controllerSearch,
        onSearchChanged: onSearchChanged,
      );
    }
  }

  WidgetStatePropertyAll<Color>? _convertToWidgetStateProperty(T backgroundColor) {
    if (backgroundColor is WidgetStatePropertyAll<Color>) {
      return backgroundColor;
    }
    return null;
  }

  Color? _convertToColor(T backgroundColor) {
    if (backgroundColor is Color) {
      return backgroundColor;
    }
    return null;
  }
}
