import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/input_models/password_retype_input.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<SignUpState> build() {
    return const SignUpState();
  }

  void updateEmailField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const emailInput = EmailInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            emailInput: emailInput,
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
        const passwordInput = PasswordInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordInput: passwordInput,
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

  void updatePasswordRetypeField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const passwordRetype = PasswordRetypeInput.pure(null);

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordRetypeInput: passwordRetype,
          ),
        );
      } else {
        final password = PasswordRetypeInput.dirty(
          value: newValue,
          passwordToMatch: stateValue.passwordInput.value,
        );

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordRetypeInput: password,
          ),
        );
      }
    }
  }

  Future<void> signUpWithEmail() async {
    final stateValue = state.valueOrNull;
    if (stateValue != null && stateValue.isValid) {
      final authRepository = ref.read(authRepositoryProvider);
      state = const AsyncLoading<SignUpState>();

      try {
        await authRepository.signUpWithEmail(
          email: stateValue.emailInput.value,
          password: stateValue.passwordInput.value,
          username: stateValue.usernameInput.value,
        );
      } catch (e) {
        state = AsyncError<SignUpState>(e, StackTrace.current);
        return;
      }
      state = AsyncData<SignUpState>(state.requireValue);
    }
  }
}
