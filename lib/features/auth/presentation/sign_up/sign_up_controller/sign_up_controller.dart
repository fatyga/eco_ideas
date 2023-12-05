import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
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

    Future<void> signUpWithEmail() async {
      final stateValue = state.valueOrNull;
      if (stateValue != null && stateValue.isValid) {
        final authRepository = ref.read(authRepositoryProvider);
        state = const AsyncLoading<SignUpState>();

        try {
          await authRepository.signUpWithEmail(
            email: stateValue.email.value,
            password: stateValue.password.value,
            username: stateValue.username.value,
          );
        } catch (e) {
          state = AsyncError<SignUpState>(e, StackTrace.current);
          return;
        }
        state = AsyncData<SignUpState>(state.requireValue);
      }
    }
  }
}
