import 'package:flutter/material.dart';

class ListTitleAndroid extends StatelessWidget {
  final double? horizontalTitleGap;
  final EdgeInsetsGeometry? padding;
  final Widget title;
  final Widget subtitle;
  const ListTitleAndroid({super.key, this.padding, required this.title, required this.subtitle, this.horizontalTitleGap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: padding,
      title: title,
      subtitle: subtitle,
      horizontalTitleGap: horizontalTitleGap,
    );
  }
}
