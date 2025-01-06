import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) => GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, _) => const SignInScreen()),
      ],
    );
