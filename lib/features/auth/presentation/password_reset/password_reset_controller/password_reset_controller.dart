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

  Future<void> resetPasswordForEmail() async {
    if (state.hasValue && state.value!.email != null) {
      state = const AsyncLoading<PasswordResetState>().copyWithPrevious(state);
      await ref
          .read(authRepositoryProvider)
          .resetPasswordForEmail(email: state.value!.email!);
      state = AsyncData(
        state.requireValue.copyWith(step: PasswordResetStep.sendingLink),
      );
    }
  }
}
