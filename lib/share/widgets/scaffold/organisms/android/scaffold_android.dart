import 'package:flutter/material.dart';

class ScaffoldAndroid extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const ScaffoldAndroid({super.key, this.appBar, required this.body, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: body, backgroundColor: backgroundColor);
  }
}
