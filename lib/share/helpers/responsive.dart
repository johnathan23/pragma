import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({super.key, required this.mobile, this.tablet, required this.desktop, this.mobileLarge});

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) => MediaQuery.of(context).size.width >= 500 && MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<MapEntry<int, Widget?>> responsiveMap = [MapEntry(1024, desktop), MapEntry(700, tablet), MapEntry(500, mobileLarge)];

    for (MapEntry<int, Widget?> entry in responsiveMap) {
      if (size.width >= entry.key) {
        return entry.value ?? desktop;
      }
    }
    return mobile;
  }
}
