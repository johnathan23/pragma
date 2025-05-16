import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/share/widgets/appbars/organisms/android/appbar_android.dart';
import 'package:pragma_exam/share/widgets/appbars/organisms/ios/appbar_ios.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Color? bgColor;

  const CustomAppbar({super.key, this.title, this.bgColor});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return AppbarIos(title: title, bgColor: bgColor);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return AppbarAndroid(title: title, bgColor: bgColor);
    } else {
      return AppbarAndroid(title: title, bgColor: bgColor);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
