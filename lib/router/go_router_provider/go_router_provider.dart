import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/foundation.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(authChangesProvider, (_, next) {
      next.when(
          data: (status) => isAuth.value = AsyncData(status.isAuthenticated),
          error: (_, __) => const AsyncData(false),
          loading: () => const AsyncData(false));
    });

  final router = GoRouter(
      initialLocation: const SplashRoute().location,
      routes: $appRoutes,
      refreshListenable: isAuth,
      redirect: (context, state) {
        if (isAuth.value.unwrapPrevious().hasError) {
          return const SignInRoute().location;
        }

        if (isAuth.value.isLoading || !isAuth.value.hasValue) {
          return const SplashRoute().location;
        }

        final auth = isAuth.value.requireValue;

        final isSplash = state.uri.path == const SplashRoute().location;
        if (isSplash) {
          return auth
              ? const HomeRoute().location
              : const SignInRoute().location;
        }

        final inAuthenticationProcess =
            state.uri.path == const SignInRoute().location;

        if (inAuthenticationProcess) {
          return auth ? const HomeRoute().location : null;
        }

        return auth ? null : const SplashRoute().location;
      });

  ref.onDispose(router.dispose);
  return router;
}
