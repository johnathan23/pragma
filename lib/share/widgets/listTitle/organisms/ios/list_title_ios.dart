import 'package:flutter/cupertino.dart';

class ListTitleIos extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget title;
  final Widget subtitle;

  const ListTitleIos({super.key, required this.title, required this.subtitle, this.padding});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      padding: padding,
      title: title,
      subtitle: subtitle,
    );
  }
}
