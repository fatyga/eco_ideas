import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_reset_controller.g.dart';
part 'password_reset_controller.freezed.dart';

enum PasswordResetStep { initial, sendingLink, settingPassword }

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState({
    @Default(PasswordResetStep.initial) PasswordResetStep step,
    String? email,
  }) = _PasswordResetState;
}

@riverpod
class PasswordResetController extends _$PasswordResetController {
  @override
  FutureOr<PasswordResetState> build() {
    return const PasswordResetState();
  }

  Future<void> resetPasswordForEmail() async {
    if (state.hasValue && state.value!.email != null) {
      state = const AsyncLoading();
      await ref
          .read(authRepositoryProvider)
          .resetPasswordForEmail(email: state.value!.email!);
      state = AsyncData(
        state.requireValue.copyWith(step: PasswordResetStep.sendingLink),
      );
    }
  }
}
