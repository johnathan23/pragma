import 'package:flutter/cupertino.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';

class SearchBarIos extends StatelessWidget {
  final String hintText;
  final Color? backgroundColor;
  final TextEditingController controllerSearch;
  final void Function(String) onSearchChanged;

  const SearchBarIos({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.controllerSearch,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSize10),
        CupertinoSearchTextField(
          placeholder: hintText,
          backgroundColor: backgroundColor,
          onSuffixTap: () {
            controllerSearch.clear();
            onSearchChanged('');
          },
          controller: controllerSearch,
          onChanged: onSearchChanged,
        ),
        const SizedBox(height: kSize10),
      ],
    );
  }
}
