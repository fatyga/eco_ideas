import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/controller/state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        const passwordInput = RestrictedPasswordInput.pure();

        state = AsyncData(
          stateValue.copyWith(
            passwordInput: passwordInput,
          ),
        );
      } else {
        final passwordInput = RestrictedPasswordInput.dirty(value: newValue);

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
          state = AsyncData(
            stateValue.copyWith(
              passwordInput: passwordInput,
              passwordRetypeInput: passwordRetypeInput,
            ),
          );
        } else {
          state = AsyncData(
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

        state = AsyncData(
          stateValue.copyWith(
            passwordRetypeInput: passwordRetypeInput,
          ),
        );
      } else {
        final passwordRetypeInput = PasswordRetypeInput.dirty(
          value: newValue,
          passwordToMatch: stateValue.passwordInput.isValid
              ? stateValue.passwordInput.value
              : null,
        );

        state = AsyncData(
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
      } on EIAuthException catch (e) {
        state = AsyncError(e, StackTrace.current);
        return;
      }
      state = AsyncData<PasswordResetSecondStepState>(
        state.requireValue.copyWith(),
      );
    }
  }

  Future<void> abortPasswordReset() async {
    final stateValue = state.valueOrNull;

    final isPasswordResetStillActive =
        ref.watch(authChangesProvider).valueOrNull?.isPasswordReset;

    if (stateValue != null && isPasswordResetStillActive != null) {
      if (isPasswordResetStillActive) {
        state = const AsyncLoading<PasswordResetSecondStepState>();
        try {
          await ref.read(authRepositoryProvider).signOut();
        } on EIAuthException catch (e) {
          state =
              AsyncError<PasswordResetSecondStepState>(e, StackTrace.current);
        }
      }
    }
  }
}
