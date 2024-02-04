import 'dart:io';

import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<SignUpState> build() {
    return const SignUpState();
  }

  void updateUsernameField(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const usernameInput = UsernameInput.pure();

        state = AsyncValue.data(
          stateValue.copyWith(
            usernameInput: usernameInput,
          ),
        );
      } else {
        final usernameInput = UsernameInput.dirty(value: newValue);

        state = AsyncValue.data(
          stateValue.copyWith(
            usernameInput: usernameInput,
          ),
        );
      }
    }
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
        const passwordInput = RestrictedPasswordInput.pure();

        state = AsyncValue.data(
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
          passwordToMatch: stateValue.passwordInput.isValid
              ? stateValue.passwordInput.value
              : null,
        );

        state = AsyncValue.data(
          stateValue.copyWith(
            passwordRetypeInput: passwordRetypeInput,
          ),
        );
      }
    }
  }

  void updateAvatar(String? avatarUrl) {
    final stateValue = state.valueOrNull;
    if (avatarUrl != null &&
        avatarUrl.isNotEmpty &&
        stateValue != null &&
        avatarUrl != stateValue.avatarUrl) {
      state = AsyncValue.data(stateValue.copyWith(avatarUrl: avatarUrl));
    }
  }

  Future<void> signUpWithEmail() async {
    final stateValue = state.valueOrNull;
    if (stateValue != null && stateValue.isValid) {
      final authRepository = ref.read(authRepositoryProvider);

      state = const AsyncLoading<SignUpState>();

      try {
        final newUserId = await authRepository.signUpWithEmail(
          email: stateValue.emailInput.value,
          password: stateValue.passwordInput.value,
          username: stateValue.usernameInput.value,
        );

        if (newUserId != null && stateValue.avatarUrl != null) {
          final userRepository = ref.read(userRepositoryProvider);
          await userRepository.uploadAvatar(
            userId: newUserId,
            image: File(stateValue.avatarUrl!),
          );
        }

        state = AsyncData<SignUpState>(state.requireValue);
      } catch (e) {
        state = AsyncError<SignUpState>(e, StackTrace.current);
        return;
      }
    }
  }
}
