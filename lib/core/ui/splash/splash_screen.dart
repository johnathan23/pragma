import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_exam/config/constants/app_constants.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/fade_animation.dart';
import 'package:pragma_exam/core/ui/home/home_screen.dart';
import 'package:pragma_exam/share/helpers/responsive.dart';
import 'package:pragma_exam/share/widgets/scaffold/custom_scaffold.dart';

class SplashScreen extends StatefulWidget {
  static const String screenName = 'splash';
  static const String path = '/$screenName';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goToHome() => context.replaceNamed(HomeScreen.screenName);

  @override
  void initState() {
    super.initState();
    Timer(k3sec, () => _goToHome());
  }

  @override
  Widget build(BuildContext context) {
    final double sizeImage = _getSizeImageByPlatform(context);
    return SafeArea(
      child: CustomScaffold(
        backgroundColor: kGrey02,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [FadeAnimation(duration: k3sec, child: Image.asset(kImageLogoPath, width: sizeImage, height: sizeImage))],
        ),
      ),
    );
  }

  double _getSizeImageByPlatform(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return kSize200;
    }

    if (Responsive.isMobileLarge(context)) {
      return kSize300;
    }

    if (Responsive.isTablet(context)) {
      return kSize400;
    }

    return kSize500;
  }
}
