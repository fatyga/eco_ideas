import 'dart:async';

import 'package:eco_ideas/common/widgets/loading_screen.dart';
import 'package:eco_ideas/features/auth/presentation/auth/auth_screen.dart';

import 'package:eco_ideas/features/auth/presentation/presentation.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_screen.dart';
import 'package:eco_ideas/features/explore/presentation/explore/explore_screen.dart';

import 'package:eco_ideas/features/home/presentation/presentation.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/idea_editor_screen.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/idea_introductor.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_presenter/idea_presenter_screen.dart';
import 'package:eco_ideas/features/ideas/presentation/my_ideas/my_ideas_screen.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/modify_my_profile_screen.dart';
import 'package:eco_ideas/features/user/presentation/my_profile/my_profile_screen.dart';
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

// Loading
@TypedGoRoute<LoadingRoute>(path: LoadingScreen.path)
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingScreen();
  }
}

// Home
@TypedGoRoute<HomeRoute>(
  path: HomeScreen.path,
  routes: [
    TypedGoRoute<SignUpCompletionRoute>(path: SignUpCompletionScreen.path),
    TypedGoRoute<ExploreRoute>(path: ExploreScreen.path),
    TypedGoRoute<MyIdeasRoute>(
      path: MyIdeasScreen.path,
    ),
    TypedGoRoute<IdeaEditorRoute>(path: IdeaEditorScreen.routePath),
    TypedGoRoute<IdeaPresenterRoute>(path: IdeaPresenterScreen.path),
    TypedGoRoute<IdeaIntroductorRoute>(path: IdeaIntroductorScreen.path),
    TypedGoRoute<MyProfileRoute>(path: MyProfileScreen.path),
    TypedGoRoute<ModifyMyProfileRoute>(path: ModifyMyProfileScreen.path),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class ExploreRoute extends GoRouteData {
  const ExploreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreScreen();
  }
}

// My Ideas
class MyIdeasRoute extends GoRouteData {
  const MyIdeasRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyIdeasScreen();
  }
}

class IdeaEditorRoute extends GoRouteData {
  const IdeaEditorRoute(this.$extra);

  final EcoIdea? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IdeaEditorScreen(idea: $extra);
  }
}

class IdeaPresenterRoute extends GoRouteData {
  const IdeaPresenterRoute(this.$extra);
  final EcoIdea $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IdeaPresenterScreen(idea: $extra);
  }
}

class IdeaIntroductorRoute extends GoRouteData {
  const IdeaIntroductorRoute(this.$extra);
  final EcoIdeaStep $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return IdeaIntroductorScreen(introduction: $extra);
  }
}

class MyProfileRoute extends GoRouteData {
  const MyProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyProfileScreen();
  }
}

class ModifyMyProfileRoute extends GoRouteData {
  const ModifyMyProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ModifyMyProfileScreen();
  }
}

class SignUpCompletionRoute extends GoRouteData {
  const SignUpCompletionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpCompletionScreen();
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
