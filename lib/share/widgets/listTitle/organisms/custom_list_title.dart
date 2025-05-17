import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pragma_exam/share/widgets/listTitle/organisms/android/list_title_android.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/share/widgets/listTitle/organisms/ios/list_title_ios.dart';

class CustomListTitle extends StatelessWidget {
  final double? horizontalTitleGap;
  final EdgeInsetsGeometry? padding;
  final Widget title;
  final Widget subtitle;

  const CustomListTitle({super.key, this.horizontalTitleGap, this.padding, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return ListTitleIos(title: title, subtitle: subtitle);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return ListTitleAndroid(title: title, subtitle: subtitle, horizontalTitleGap: horizontalTitleGap, padding: padding);
    } else {
      return ListTitleAndroid(title: title, subtitle: subtitle, horizontalTitleGap: horizontalTitleGap, padding: padding);
    }
  }
}
