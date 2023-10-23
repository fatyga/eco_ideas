import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:eco_ideas/features/home/presentation/presentation.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: SignInScreen.path,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.path,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
