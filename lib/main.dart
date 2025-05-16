import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pragma_exam/share/helpers/custom_scroll_behavior.dart';

import 'config/constants/app_constants.dart';
import 'config/constants/environment_constants.dart';
import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';
import 'core/infrastructure/db/session/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setPreferredOrientations();
  _initSharedPreferences();
  await Environment.load();
  usePathUrlStrategy();
  runApp(ProviderScope(child: const MyApp()));
}

void _setPreferredOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

void _initSharedPreferences() async {
  final SharedPreferences sharedPreferences = SharedPreferences();
  await sharedPreferences.init();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: kAppName,
      theme: AppTheme.light,
      routerConfig: ref.watch(routerProvider),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
