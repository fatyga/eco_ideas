import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/password_input.dart';
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
            email: email,
          ),
        );
      } else {
        final email = EmailInput.dirty(value: newValue);

        state = AsyncValue.data(
          stateValue.copyWith(
            email: email,
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
            password: password,
          ),
        );
      } else {
        final password = PasswordInput.dirty(value: newValue);

        state = AsyncValue.data(
          stateValue.copyWith(
            password: password,
          ),
        );
      }
    }
  }

  Future<void> signInWithEmail() async {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      final authRepository = ref.read(authRepositoryProvider);
      state = const AsyncValue<SignInState>.loading().copyWithPrevious(state);

      try {
        await authRepository.signInWithEmail(
          email: stateValue.email.value,
          password: stateValue.password.value,
        );
      } catch (e) {
        state = AsyncError<SignInState>(e, StackTrace.current)
            .copyWithPrevious(state);
        return;
      }

      state = AsyncValue.data(stateValue);
    }
  }
}
