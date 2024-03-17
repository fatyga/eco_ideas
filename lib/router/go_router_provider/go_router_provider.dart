import 'package:eco_ideas/features/auth/data/data.dart';
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
    redirect: (context, state) async {
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

          // Forbid access to password reset form
          if (path == const PasswordResetSecondStepRoute().location) {
            return const PasswordResetFirstStepRoute().location;
          }
          // Forbid access to no authentication-related routes
          if (!path.contains(const AuthRoute().location)) {
            return const SignInRoute().location;
          }
          return null;
        case AuthStatus.authenticated:
          final path = state.uri.path;

          final currentUser =
              await ref.read(userRepositoryProvider).getUserProfile();

          if (currentUser != null && !currentUser.signUpCompleted) {
            return const SignUpCompletionRoute().location;
          }
          // Redirect user from authentication-related routes
          if (!path.contains(const HomeRoute().location)) {
            return const HomeRoute().location;
          }
          return null;
        case AuthStatus.passwordReset:
          // Restrict access only for password reset form route
          return const PasswordResetSecondStepRoute().location;
      }
    },
  );

  ref.onDispose(router.dispose);
  return router;
}
