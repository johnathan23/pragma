part of '../custom_search_appbar.dart';

class SearchAppbarIos extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const SearchAppbarIos({super.key, this.title, this.actions, this.bgColor});

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
