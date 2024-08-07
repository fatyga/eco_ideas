import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';

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
    })
    ..listen(userProfileChangesProvider, (_, next) {
      next.whenData((profile) {
        //@TODO(fatyga): check for a better way to redirect newly registrated user
        if (!profile.signUpCompleted) {
          ref.state.go(const SignUpCompletionRoute().location);
        }
      });
    });

  // Checks whether deep link is invalid or expired and give user a feedback
  void checkDeepLink(BuildContext context, Uri deepLink) {
    try {
      ref.read(authRepositoryProvider).determineInvalidDeepLink(deepLink);
    } on EIException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.resolveMessageForUser(context.l10n))),
      );
    }
  }

  final router = GoRouter(
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    debugLogDiagnostics: true,
    refreshListenable: isAuth,
    redirect: (context, state) async {
      print(state.uri);
      if (isAuth.value.unwrapPrevious().hasError) {
        return const SignInRoute().location;
      }
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return const SplashRoute().location;
      }

      checkDeepLink(context, state.uri);

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

          ref.read(userProfileChangesProvider).whenData((userProfile) {
            if (!userProfile.signUpCompleted) {
              return const SignUpCompletionRoute().location;
            }
          });

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
