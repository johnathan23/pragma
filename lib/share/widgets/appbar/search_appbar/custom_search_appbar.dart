import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/config/theme/app_dimensions.dart';

part 'android/search_appbar_android.dart';
part 'ios/search_appbar_ios.dart';

class CustomSearchAppbar extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const CustomSearchAppbar({super.key, this.title, this.actions, this.bgColor});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return _buildSearchAppbarIos(title: title, bgColor: bgColor);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return _buildSearchAppbarAndroid(title: title, bgColor: bgColor);
    } else {
      return _buildSearchAppbarAndroid(title: title, bgColor: bgColor);
    }
  }

  Widget _buildSearchAppbarAndroid({Widget? title, Color? bgColor}) {
    return SearchAppbarAndroid(title: title, bgColor: bgColor, actions: [_iconSearch()]);
  }

  Widget _buildSearchAppbarIos({Widget? title, Color? bgColor}) {
    return SearchAppbarIos(title: title, bgColor: bgColor, actions: [_iconSearch()]);
  }

  Widget _iconSearch() {
    return IconButton(icon: const Icon(Icons.search), onPressed: () {});
  }
}
