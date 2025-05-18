import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';

class AppbarAndroid extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const AppbarAndroid({super.key, this.title, this.actions, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: bgColor, elevation: kNone, title: title, actions: actions, centerTitle: true);
  }
}
