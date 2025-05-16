part of 'app_router.dart';

final appRoutes = [
  // ? Add your routes here
  GoRoute(
    name: SplashScreen.screenName,
    path: SplashScreen.path,
    pageBuilder:
        (context, state) => PageTransitions(screen: SplashScreen(), transitionType: TransitionType.fade, durationTransition: k500milSec),
  ),
  GoRoute(
    name: HomeScreen.screenName,
    path: HomeScreen.path,
    pageBuilder:
        (context, state) => PageTransitions(screen: HomeScreen(), transitionType: TransitionType.slide, durationTransition: k500milSec),
  ),
  GoRoute(
    name: DetailScreen.screenName,
    path: DetailScreen.path,
    routes: _detailRoutes,
    pageBuilder: (context, state) => _previewScreen(breedId: null),
  ),
];

final _detailRoutes = [
  GoRoute(
    path: '/:breedId',
    pageBuilder: (context, state) {
      final String? userId = state.pathParameters['breedId'];
      return _previewScreen(breedId: userId);
    },
  ),
];

PageTransitions _previewScreen({required String? breedId}) {
  return PageTransitions(screen: DetailScreen(breedId: breedId), transitionType: TransitionType.fade, durationTransition: k500milSec);
}
