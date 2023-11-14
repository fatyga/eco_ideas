import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';
part 'sign_in_controller.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    String? email,
    String? password,
  }) = _SignInState;
}

@riverpod
class SignInController extends _$SignInController {
  FutureOr<SignInState> build() {
    return const SignInState();
  }

  void updateEmailField(String newValue) {
    if (!state.isLoading) {
      state = AsyncValue.data(
          state.unwrapPrevious().value!.copyWith(email: newValue));
    }
  }

  void updatePasswordField(String newValue) {
    if (!state.isLoading) {
      state = AsyncValue.data(
          state.unwrapPrevious().value!.copyWith(password: newValue));
    }
  }

  Future<void> signInWithEmail() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    try {
      await authRepository.signInWithEmail(
        email: state.value!.email!,
        password: state.value!.password!,
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
