import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_future.g.dart';

@riverpod
Future<void> signInWithEmail(
  SignInWithEmailRef ref,
  String email,
  String password,
) async {
  final authRepository = ref.read(authRepositoryProvider);

  try {
    await authRepository.signInWithEmail(
      email: email,
      password: password,
    );
  } on EIAuthException catch (_) {
    throw SignInFail();
  }
}
