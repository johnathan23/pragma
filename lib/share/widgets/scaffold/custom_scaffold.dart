import 'package:flutter/cupertino.dart';
import 'package:pragma_exam/share/widgets/scaffold/organisms/android/scaffold_android.dart';
import 'dart:io' show Platform;

import 'package:pragma_exam/share/widgets/scaffold/organisms/ios/scaffold_ios.dart';

class CustomScaffold<T> extends StatelessWidget {
  final Widget body;
  final T? appBar;
  final Color? backgroundColor;

  const CustomScaffold({super.key, required this.body, this.appBar, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return ScaffoldIos(appBar: _convertToObstructingPreferredSizeWidget(appBar), body: body);
    } else if (Platform.isAndroid || Platform.isFuchsia) {
      return ScaffoldAndroid(appBar: _convertToPreferredSizeWidget(appBar), body: body, backgroundColor: backgroundColor);
    } else {
      return ScaffoldAndroid(appBar: _convertToPreferredSizeWidget(appBar), body: body, backgroundColor: backgroundColor);
    }
  }

  ObstructingPreferredSizeWidget? _convertToObstructingPreferredSizeWidget(T? appBar) {
    if (appBar is ObstructingPreferredSizeWidget) {
      return appBar;
    }
    return null;
  }

  PreferredSizeWidget? _convertToPreferredSizeWidget(T? appBar) {
    if (appBar is PreferredSizeWidget) {
      return appBar;
    }
    return null;
  }
}
