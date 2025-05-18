import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/share/widgets/appbars/organisms/android/appbar_android.dart';
import 'package:pragma_exam/share/widgets/appbars/organisms/ios/appbar_ios.dart';

class CustomSearchAppbar extends StatelessWidget implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final Widget? title;
  final Color? bgColor;
  final void Function()? onPressedSearch;

  const CustomSearchAppbar({super.key, this.title, this.bgColor, this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return AppbarIos(title: title, bgColor: bgColor, actions: [_iconSearch(onPressedSearch)]);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return AppbarAndroid(title: title, bgColor: bgColor, actions: [_iconSearch(onPressedSearch)]);
    } else {
      return AppbarAndroid(title: title, bgColor: bgColor, actions: [_iconSearch(onPressedSearch)]);
    }
  }

  Widget _iconSearch(void Function()? onPressedSearch) {
    return IconButton(icon: const Icon(Icons.search), onPressed: onPressedSearch);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
