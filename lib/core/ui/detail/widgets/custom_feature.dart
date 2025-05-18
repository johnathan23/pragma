import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';

class CustomFeature extends StatelessWidget {
  final String feature;
  final String valueFeature;
  final IconData icon;

  const CustomFeature({super.key, required this.feature, required this.valueFeature, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: kGrey, size: kSize20),
        const SizedBox(width: kSize10),
        Flexible(child: _customText(context, '$feature: ', valueFeature)),
      ],
    );
  }

  Text _customText(BuildContext context, String text, String value) {
    return Text.rich(
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlack, fontWeight: FontWeight.w500),
        children: [TextSpan(text: value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kBlack))],
      ),
    );
  }
}
