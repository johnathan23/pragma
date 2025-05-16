part of '../custom_search_appbar.dart';

class SearchAppbarAndroid extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? bgColor;

  const SearchAppbarAndroid({super.key, this.title, this.actions, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: bgColor, elevation: kNone, title: title, actions: actions, centerTitle: true);
  }
}
