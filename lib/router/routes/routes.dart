import 'dart:async';

import 'package:eco_ideas/features/auth/presentation/auth/auth_screen.dart';
import 'package:eco_ideas/features/auth/presentation/presentation.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:eco_ideas/features/home/presentation/presentation.dart';
import 'package:eco_ideas/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// Splash
@TypedGoRoute<SplashRoute>(path: SplashScreen.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

// Home
@TypedGoRoute<HomeRoute>(path: HomeScreen.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

// Authentication
@TypedGoRoute<AuthRoute>(
  path: '/auth',
  routes: [
    TypedGoRoute<SignInRoute>(
      path: SignInScreen.path,
    ),
    TypedGoRoute<SignUpRoute>(
      path: SignUpScreen.path,
    ),
    TypedGoRoute<PasswordResetRoute>(
      path: 'passwordReset',
      routes: [
        TypedGoRoute<PasswordResetFirstStepRoute>(
          path: PasswordResetFirstStepScreen.path,
        ),
        TypedGoRoute<PasswordResetSecondStepRoute>(
          path: PasswordResetSecondStepScreen.path,
        ),
      ],
    ),
  ],
)
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (state.uri.path == const AuthRoute().location) {
      return const SignInRoute().location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthScreen();
  }
}

class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

class PasswordResetRoute extends GoRouteData {
  const PasswordResetRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (state.uri.path == const PasswordResetRoute().location) {
      return const PasswordResetFirstStepRoute().location;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold();
  }
}

class PasswordResetFirstStepRoute extends GoRouteData {
  const PasswordResetFirstStepRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PasswordResetFirstStepScreen();
  }
}

class PasswordResetSecondStepRoute extends GoRouteData {
  const PasswordResetSecondStepRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PasswordResetSecondStepScreen();
  }
}
