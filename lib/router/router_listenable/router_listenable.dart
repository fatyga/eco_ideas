import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuthenticated = false;

  @override
  Future<void> build() async {
    _isAuthenticated = ref.watch(authChangesProvider).when(
          data: (status) {
            return status.isAuthenticated;
          },
          error: (_, __) => false,
          loading: () => false,
        );

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.matchedLocation == SplashRoute.path;

    if (isSplash) {
      return _isAuthenticated ? HomeRoute.path : SignInRoute.path;
    }

    final isAuthProcess = state.matchedLocation == SignInRoute.path ||
        state.matchedLocation == SignUpRoute.path;
    if (isAuthProcess) return _isAuthenticated ? HomeRoute.path : null;
    return _isAuthenticated ? null : SplashRoute.path;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
