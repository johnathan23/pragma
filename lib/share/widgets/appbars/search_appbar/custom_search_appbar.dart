import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/config/theme/app_dimensions.dart';

part 'android/search_appbar_android.dart';
part 'ios/search_appbar_ios.dart';

class CustomSearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? bgColor;
  final void Function()? onPressedSearch;

  const CustomSearchAppbar({super.key, this.title, this.bgColor, this.onPressedSearch});

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

  Widget _buildSearchAppbarAndroid({Widget? title, Color? bgColor, void Function()? onPressedSearch}) {
    return SearchAppbarAndroid(title: title, bgColor: bgColor, actions: [_iconSearch(onPressedSearch)]);
  }

  Widget _buildSearchAppbarIos({Widget? title, Color? bgColor, void Function()? onPressedSearch}) {
    return SearchAppbarIos(title: title, bgColor: bgColor, actions: [_iconSearch(onPressedSearch)]);
  }

  Widget _iconSearch(void Function()? onPressedSearch) {
    return IconButton(icon: const Icon(Icons.search), onPressed: onPressedSearch);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
