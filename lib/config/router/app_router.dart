import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragma_exam/core/domain/enum/log_level_enum.dart';
import 'package:pragma_exam/core/domain/enum/transition_type_enum.dart';
import 'package:pragma_exam/core/ui/detail/detail_screen.dart';
import 'package:pragma_exam/core/ui/home/home_screen.dart';
import 'package:pragma_exam/core/ui/splash/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pragma_exam/share/helpers/custom_console.dart';

import '../theme/app_dimensions.dart' show k500milSec;
import 'transitions/page_transitions.dart';

part 'app_router.g.dart';

part 'routes.dart';

@riverpod
class Router extends _$Router {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter build() {
    return GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: SplashScreen.path, redirect: _redirect, routes: appRoutes);
  }

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    CustomConsole.log(
      message:
          'cae en el redirect => name:${state.name}, path: ${state.path}, pathParams: ${state.pathParameters}, topRoute: ${state.topRoute}, extra: ${state.extra}, fullPath: ${state.fullPath}, uri: ${state.uri}, error: ${state.error}',
      level: LogLevel.info,
    );

    if (state.uri.path == '/') {
      return HomeScreen.path;
    }
    return null;
  }
}
