import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ClearIcon extends StatelessWidget {
  final void Function()? onPressed;

  const ClearIcon({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: const Icon(Symbols.close), onPressed: onPressed);
  }
}
