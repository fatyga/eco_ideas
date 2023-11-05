import 'package:eco_ideas/features/auth/presentation/presentation.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:eco_ideas/features/home/presentation/presentation.dart';
import 'package:eco_ideas/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
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
@TypedGoRoute<SignInRoute>(path: SignInScreen.path)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

@TypedGoRoute<SignUpRoute>(path: SignUpScreen.path)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}

@TypedGoRoute<PasswordRecoveryRoute>(path: PasswordRecoveryScreen.path)
class PasswordRecoveryRoute extends GoRouteData {
  const PasswordRecoveryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PasswordRecoveryScreen();
  }
}
