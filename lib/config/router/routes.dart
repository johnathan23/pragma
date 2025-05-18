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
    pageBuilder: (context, state) {
      CatEntity? catEntity = state.extra as CatEntity?;
      return _previewScreen(catEntity: catEntity);
    },
  ),
];

PageTransitions _previewScreen({required CatEntity? catEntity}) {
  return PageTransitions(screen: DetailScreen(catEntity: catEntity), transitionType: TransitionType.fade, durationTransition: k500milSec);
}
