import 'package:flutter/cupertino.dart';

class ScaffoldIos extends StatelessWidget {
  final ObstructingPreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;

  const ScaffoldIos({super.key, this.appBar, required this.body, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(navigationBar: appBar, backgroundColor: backgroundColor, child: body);
  }
}
