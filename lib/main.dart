import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma_exam/share/helpers/custom_scroll_behavior.dart';

import 'config/constants/app_constants.dart';
import 'config/constants/environment_constants.dart';
import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setPreferredOrientations();
  await Environment.load();
  runApp(ProviderScope(child: const MyApp()));
}

void _setPreferredOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: kAppName,
      theme: AppTheme.light,
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: !kReleaseMode && !kProfileMode,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
