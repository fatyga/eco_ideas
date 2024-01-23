import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/foundation.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final isAuth =
      ValueNotifier<AsyncValue<AuthStatus>>(const AsyncLoading<AuthStatus>());

  ref
    ..onDispose(isAuth.dispose)
    ..listen(authChangesProvider, (_, next) {
      next.when(
        data: (status) => isAuth.value = AsyncData<AuthStatus>(status),
        error: (error, stackTrace) =>
            isAuth.value = AsyncError<AuthStatus>(error, stackTrace),
        loading: () => isAuth.value = const AsyncLoading<AuthStatus>(),
      );
    });

  final router = GoRouter(
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    debugLogDiagnostics: true,
    refreshListenable: isAuth,
    redirect: (context, state) {
      if (isAuth.value.unwrapPrevious().hasError) {
        return const SignInRoute().location;
      }
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return const SplashRoute().location;
      }

      final authStatus = isAuth.value.requireValue;

      switch (authStatus) {
        case AuthStatus.unknown:
          return const SplashRoute().location;
        case AuthStatus.unauthenticated:
          final path = state.uri.path;

          if (!path.contains(const AuthRoute().location)) {
            return const SignInRoute().location;
          }
          return null;
        case AuthStatus.authenticated:
          final path = state.uri.path;

          if (!path.contains(const HomeRoute().location)) {
            return const HomeRoute().location;
          }
          return null;
        case AuthStatus.passwordReset:
          return const PasswordResetSecondStepRoute().location;
      }

      // if (authStatus.isUnknown) return const SplashRoute().location;

      // final isSplash = state.uri.path == const SplashRoute().location;
      // if (isSplash) {
      //   return authStatus.isAuthenticated
      //       ? const HomeRoute().location
      //       : const SignInRoute().location;
      // }

      // final isPasswordResetStatus = authStatus.isPasswordReset;

      // if (isPasswordResetStatus) {
      //   return const PasswordResetSecondStepRoute().location;
      // }

      // final isPasswordReset =
      //     state.uri.path.contains(const PasswordResetRoute().location);

      // if (isPasswordReset) {
      //   return authStatus.isPasswordReset
      //       ? const PasswordResetSecondStepRoute().location
      //       : const PasswordResetFirstStepRoute().location;
      // }
      // final isLoggingIn = state.uri.path.contains(const AuthRoute().location);

      // if (isLoggingIn) {
      //   return authStatus.isAuthenticated ? const HomeRoute().location : null;
      // }

      // final isHome = state.uri.path == const HomeRoute().location;

      // if (isHome) {
      //   return authStatus.isAuthenticated ? null : const SignInRoute().location;
      // }

      // //return auth ? null : const SplashRoute().location; // this doesn't allow to navigate for example to PasswordRecoveryRoute
      // return null;
    },
  );

  ref.onDispose(router.dispose);
  return router;
}
