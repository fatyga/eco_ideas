import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/controller/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class PasswordResetFirstStepController
    extends _$PasswordResetFirstStepController {
  @override
  FutureOr<PasswordResetFirstStepState> build() {
    return const PasswordResetFirstStepState();
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
      state = const AsyncLoading<PasswordResetFirstStepState>();
      try {
        await ref
            .read(authRepositoryProvider)
            .resetPasswordForEmail(email: stateValue.emailInput.value);

        state = AsyncData(
          state.requireValue
              .copyWith(status: PasswordResetFirstStepStatus.linkSent),
        );
      } on AuthFailure catch (e) {
        state = AsyncError(e, StackTrace.current);
      }
    }
  }
}
