import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/controller/state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'controller.g.dart';

@riverpod
class PasswordResetSecondStepController
    extends _$PasswordResetSecondStepController {
  @override
  FutureOr<PasswordResetSecondStepState> build() {
    return const PasswordResetSecondStepState();
  }

  void updatePasswordField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const passwordInput = SignUpPasswordInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordInput: passwordInput,
          ),
        );
      } else {
        final passwordInput = SignUpPasswordInput.dirty(value: newValue);

        if (passwordInput.isValid) {
          final PasswordRetypeInput passwordRetypeInput;
          // retain passwordRetypeInput if it is pure, and update only
          // passwordToMatch if passwordInput is valid
          if (stateValue.passwordRetypeInput.isPure) {
            passwordRetypeInput = PasswordRetypeInput.pure(
              passwordToMatch: passwordInput.value,
            );
          } else {
            // retain passwordRetypeInput as dirty, and update only
            // passwordToMatch if passwordInput is valid
            passwordRetypeInput = PasswordRetypeInput.dirty(
              value: stateValue.passwordRetypeInput.value,
              passwordToMatch: passwordInput.value,
            );
          }
          state = AsyncValue.data(
            stateValue.copyWith(
              passwordInput: passwordInput,
              passwordRetypeInput: passwordRetypeInput,
            ),
          );
        } else {
          state = AsyncValue.data(
            stateValue.copyWith(
              passwordInput: passwordInput,
            ),
          );
        }
      }
    }
  }

  void updatePasswordRetypeField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        final passwordRetypeInput = PasswordRetypeInput.pure(
          passwordToMatch: stateValue.passwordInput.isValid
              ? stateValue.passwordInput.value
              : null,
        );

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordRetypeInput: passwordRetypeInput,
          ),
        );
      } else {
        final passwordRetypeInput = PasswordRetypeInput.dirty(
          value: newValue,
          passwordToMatch: stateValue.passwordInput.value,
        );

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordRetypeInput: passwordRetypeInput,
          ),
        );
      }
    }
  }

  Future<void> setNewPassword() async {
    final stateValue = state.valueOrNull;

    if (stateValue != null && stateValue.isValid) {
      state = const AsyncLoading<PasswordResetSecondStepState>();

      try {
        await ref
            .read(authRepositoryProvider)
            .setNewPassword(newPassword: stateValue.passwordInput.value);
      } on AuthException catch (e) {
        state = AsyncError(e, StackTrace.current);
      }
      state = AsyncData<PasswordResetSecondStepState>(
        state.requireValue.copyWith(
          status: PasswordResetSecondStepStatus.passwordUpdated,
        ),
      );
    }
  }

  Future<void> abortPasswordReset() async {
    final stateValue = state.valueOrNull;

    final isPasswordResetStillActive =
        ref.read(authChangesProvider).value?.isPasswordReset;

    if (stateValue != null && isPasswordResetStillActive != null) {
      if (isPasswordResetStillActive) {
        await ref.read(authRepositoryProvider).signOut();
      }
    }
  }
}
