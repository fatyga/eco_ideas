import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/password_input.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';
part 'sign_in_controller.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(EmailInput.pure()) EmailInput email,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(false) bool isValid,
  }) = _SignInState;
}

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<SignInState> build() {
    return const SignInState();
  }

  void updateEmailField(String newValue) {
    if (!state.isLoading) {
      if (newValue.isEmpty) {
        const email = PasswordInput.pure();
        final isValid = Formz.validate([email, state.value!.password]);
        state = AsyncValue.data(
          state.value!
              .copyWith(email: const EmailInput.pure(), isValid: isValid),
        );
      } else {
        final email = EmailInput.dirty(value: newValue);
        final isValid = Formz.validate([email, state.value!.password]);
        state = AsyncValue.data(
          state.value!.copyWith(email: email, isValid: isValid),
        );
      }
    }
  }

  void updatePasswordField(String newValue) {
    if (!state.isLoading) {
      if (newValue.isEmpty) {
        const password = PasswordInput.pure();
        final isValid = Formz.validate([state.value!.email, password]);
        state = AsyncValue.data(
          state.value!
              .copyWith(password: const PasswordInput.pure(), isValid: isValid),
        );
      } else {
        final password = PasswordInput.dirty(value: newValue);
        final isValid = Formz.validate([state.value!.email, password]);
        state = AsyncValue.data(
          state
              .unwrapPrevious()
              .value!
              .copyWith(password: password, isValid: isValid),
        );
      }
    }
  }

  Future<void> signInWithEmail() async {
    if (!state.isLoading && state.value!.isValid) {
      final authRepository = ref.read(authRepositoryProvider);
      state = const AsyncValue<SignInState>.loading().copyWithPrevious(state);

      try {
        await authRepository.signInWithEmail(
          email: state.value!.email.value,
          password: state.value!.password.value,
        );
      } catch (e) {
        state = AsyncError(e, StackTrace.current);
      }

      state = AsyncValue.data(state.value!);
    }
  }
}
