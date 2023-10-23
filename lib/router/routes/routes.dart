import 'package:eco_ideas/features/auth/presentation/presentation.dart';
import 'package:eco_ideas/features/home/presentation/presentation.dart';
import 'package:eco_ideas/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// Splash
@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

// Home
@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

// Authentication
@TypedGoRoute<AuthRoute>(path: AuthRoute.path, routes: [
  TypedGoRoute<SignInRoute>(path: SignInRoute.path),
  TypedGoRoute<SignUpRoute>(path: SignUpRoute.path)
])
class AuthRoute extends GoRouteData {
  const AuthRoute();
  static const path = '/auth';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class SignInRoute extends GoRouteData {
  const SignInRoute();
  static const path = 'signIn';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

class SignUpRoute extends GoRouteData {
  const SignUpRoute();
  static const path = 'signIn';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}
