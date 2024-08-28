// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $authRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'signUpCompletion',
          factory: $SignUpCompletionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'explore',
          factory: $ExploreRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'myIdeas',
          factory: $MyIdeasRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'ideaCreator',
              factory: $IdeaEditorRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'myProfile',
          factory: $MyProfileRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'modifyMyProfile',
          factory: $ModifyMyProfileRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpCompletionRouteExtension on SignUpCompletionRoute {
  static SignUpCompletionRoute _fromState(GoRouterState state) =>
      const SignUpCompletionRoute();

  String get location => GoRouteData.$location(
        '/home/signUpCompletion',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExploreRouteExtension on ExploreRoute {
  static ExploreRoute _fromState(GoRouterState state) => const ExploreRoute();

  String get location => GoRouteData.$location(
        '/home/explore',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyIdeasRouteExtension on MyIdeasRoute {
  static MyIdeasRoute _fromState(GoRouterState state) => const MyIdeasRoute();

  String get location => GoRouteData.$location(
        '/home/myIdeas',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $IdeaEditorRouteExtension on IdeaEditorRoute {
  static IdeaEditorRoute _fromState(GoRouterState state) => IdeaEditorRoute(
        state.extra as String?,
      );

  String get location => GoRouteData.$location(
        '/home/myIdeas/ideaCreator',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $MyProfileRouteExtension on MyProfileRoute {
  static MyProfileRoute _fromState(GoRouterState state) =>
      const MyProfileRoute();

  String get location => GoRouteData.$location(
        '/home/myProfile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ModifyMyProfileRouteExtension on ModifyMyProfileRoute {
  static ModifyMyProfileRoute _fromState(GoRouterState state) =>
      const ModifyMyProfileRoute();

  String get location => GoRouteData.$location(
        '/home/modifyMyProfile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authRoute => GoRouteData.$route(
      path: '/auth',
      factory: $AuthRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'signIn',
          factory: $SignInRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'signUp',
          factory: $SignUpRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'passwordReset',
          factory: $PasswordResetRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'firstStep',
              factory: $PasswordResetFirstStepRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'secondStep',
              factory: $PasswordResetSecondStepRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => const AuthRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/auth/signIn',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  String get location => GoRouteData.$location(
        '/auth/signUp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PasswordResetRouteExtension on PasswordResetRoute {
  static PasswordResetRoute _fromState(GoRouterState state) =>
      const PasswordResetRoute();

  String get location => GoRouteData.$location(
        '/auth/passwordReset',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PasswordResetFirstStepRouteExtension on PasswordResetFirstStepRoute {
  static PasswordResetFirstStepRoute _fromState(GoRouterState state) =>
      const PasswordResetFirstStepRoute();

  String get location => GoRouteData.$location(
        '/auth/passwordReset/firstStep',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PasswordResetSecondStepRouteExtension
    on PasswordResetSecondStepRoute {
  static PasswordResetSecondStepRoute _fromState(GoRouterState state) =>
      const PasswordResetSecondStepRoute();

  String get location => GoRouteData.$location(
        '/auth/passwordReset/secondStep',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
