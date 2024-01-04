import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_reset_controller.g.dart';

@riverpod
class PasswordResetController extends _$PasswordResetController {
  @override
  FutureOr<PasswordResetState> build() {
    return const PasswordResetState();
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

  Future<void> resetPasswordForEmail() async {
    final stateValue = state.valueOrNull;
    if (stateValue != null && stateValue.isValid) {
      state = const AsyncLoading<PasswordResetState>().copyWithPrevious(state);
      await ref
          .read(authRepositoryProvider)
          .resetPasswordForEmail(email: stateValue.emailInput.value);
      state = AsyncData(
        state.requireValue.copyWith(step: PasswordResetStep.sendingLink),
      );
    }
  }
}
