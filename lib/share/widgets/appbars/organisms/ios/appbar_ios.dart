import 'package:flutter/cupertino.dart';

class AppbarIos extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const AppbarIos({super.key, this.title, this.actions, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: title,
      backgroundColor: bgColor,
      automaticallyImplyMiddle: true,
      trailing: actions != null ? Row(mainAxisSize: MainAxisSize.min, children: actions!) : null,
    );
  }
}
