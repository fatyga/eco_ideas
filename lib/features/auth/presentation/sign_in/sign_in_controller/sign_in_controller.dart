import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);

    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
        () => authRepository.signInWithEmail(
          email: email,
          password: password,
        ),
      );
      return state.hasError;
    } on EIAuthException catch (_) {
      throw SignInFail();
    }
  }
}
