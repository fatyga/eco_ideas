import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<SignInState> build() {
    return const SignInState();
  }

  void updateEmailField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const email = EmailInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            emailInput: email,
          ),
        );
      } else {
        final email = EmailInput.dirty(value: newValue);

        state = AsyncValue.data(
          stateValue.copyWith(
            emailInput: email,
          ),
        );
      }
    }
  }

  void updatePasswordField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const password = PasswordInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordInput: password,
          ),
        );
      } else {
        final password = PasswordInput.dirty(value: newValue);

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordInput: password,
          ),
        );
      }
    }
  }

  Future<void> signInWithEmail() async {
    final stateValue = state.valueOrNull;
    if (stateValue != null && stateValue.isValid) {
      final authRepository = ref.read(authRepositoryProvider);
      state = const AsyncLoading<SignInState>();

      try {
        await authRepository.signInWithEmail(
          email: stateValue.emailInput.value,
          password: stateValue.passwordInput.value,
        );
      } on EIAuthException catch (e) {
        state = AsyncError<SignInState>(e, StackTrace.current);
        return;
      }
      state = AsyncData<SignInState>(state.requireValue);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } on EIAuthException catch (e) {
      state = AsyncError<SignInState>(e, StackTrace.current);
    } finally {
      state = AsyncData<SignInState>(state.requireValue);
    }
  }
}
