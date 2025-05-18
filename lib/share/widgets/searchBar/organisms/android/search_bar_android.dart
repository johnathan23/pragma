import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/share/widgets/searchBar/atom/clear_icon.dart';

class SearchBarAndroid extends StatelessWidget {
  final String hintText;
  final WidgetStatePropertyAll<Color>? backgroundColor;
  final WidgetStatePropertyAll<double>? elevation;
  final TextEditingController controllerSearch;
  final void Function(String) onSearchChanged;

  const SearchBarAndroid({
    super.key,
    required this.controllerSearch,
    required this.onSearchChanged,
    required this.hintText,
    required this.backgroundColor,
    this.elevation = const WidgetStatePropertyAll<double>(kSize1),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSize10),
        SearchBar(
          hintText: hintText,
          backgroundColor: backgroundColor,
          trailing:
              controllerSearch.text.isNotEmpty
                  ? [
                    ClearIcon(
                      onPressed: () {
                        controllerSearch.clear();
                        onSearchChanged('');
                      },
                    ),
                  ]
                  : null,
          controller: controllerSearch,
          onChanged: onSearchChanged,
          elevation: elevation,
        ),
        const SizedBox(height: kSize10),
      ],
    );
  }
}
