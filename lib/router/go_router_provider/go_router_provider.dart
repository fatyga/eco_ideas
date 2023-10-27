import 'package:eco_ideas/router/router_listenable/router_listenable.dart';
import 'package:eco_ideas/router/routes/routes.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final notifier = ref.watch(routerListenableProvider.notifier);
  return GoRouter(
    redirect: notifier.redirect,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
    refreshListenable: notifier,
  );
}
