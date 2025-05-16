import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/fade_animation.dart';
import 'package:pragma_exam/share/helpers/responsive.dart';

class SplashScreen extends StatefulWidget {
  static const String screenName = 'splash';
  static const String path = '/$screenName';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Timer(k3sec, () => context.replaceNamed(HomeScreen.screenName));
  }

  @override
  Widget build(BuildContext context) {
    final String imageLogoPath = 'assets/images/cat.png';
    final double sizeImage = _getSizeImageByPlatform(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGrey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            FadeAnimation(duration: k3sec, child: Image.asset(imageLogoPath, width: sizeImage, height: sizeImage)),
          ],
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
