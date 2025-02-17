import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/features/user/user.dart';
import 'package:eco_ideas/utils/scaffold_with_nested_navigation.dart';
import 'package:eco_ideas/utils/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'go_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorExploreKey = GlobalKey<NavigatorState>();
final _shellNavigatorIdeasKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  final authStateNotifier =
      ValueNotifier<AsyncValue<AuthState>>(const AsyncLoading<AuthState>());

  ref
    ..onDispose(authStateNotifier.dispose)
    ..listen(authChangesProvider, (_, next) {
      next.when(
        data: (authState) => authStateNotifier.value = AsyncData(authState),
        error: (error, stackTrace) =>
            authStateNotifier.value = AsyncError(error, stackTrace),
        loading: () => const AsyncLoading<AuthState>(),
      );
    });

  final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: authStateNotifier,
    initialLocation: '/myIdeas',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExploreKey,
            routes: [
              GoRoute(
                path: '/explore',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Scaffold(body: Center(child: Text('Explore'))),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorIdeasKey,
            routes: [
              GoRoute(
                path: '/myIdeas',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MyIdeasScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/userProfile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: UserProfileScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'editor',
                    builder: (context, _) => const UserProfileEditor(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/ideaEditor',
        builder: (context, _) => const IdeaEditorScreen(),
      ),
      GoRoute(path: '/splash', builder: (context, _) => const SplashScreen()),
      GoRoute(
        path: '/signIn',
        builder: (context, _) => const SignInScreen(),
        routes: [
          GoRoute(
            path: 'passwordResetFirstStep',
            builder: (context, _) => const PasswordResetFirstStepScreen(),
          ),
          GoRoute(
            path: 'signUp',
            builder: (context, _) => const SignUpScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/passwordResetSecondStep',
        builder: (context, _) => const PasswordResetSecondStepScreen(),
      ),
    ],
    redirect: (context, state) {
      if (authStateNotifier.value.unwrapPrevious().hasError) {
        return '/signIn';
      }

      if (authStateNotifier.value.isLoading ||
          !authStateNotifier.value.hasValue) {
        return '/splash';
      }

      final authState = authStateNotifier.value.requireValue;

      if (authState.session == null) {
        if (!state.uri.path.contains('/signIn')) {
          return '/signIn';
        }
      }

      if (authState.session != null) {
        if (state.uri.path.contains('/signIn')) {
          return '/explore';
        }
      }
      return null;
    },
  );

  ref.onDispose(router.dispose);
  return router;
}
