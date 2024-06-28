import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class PasswordResetFirstStepController
    extends _$PasswordResetFirstStepController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(String email) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () =>
          ref.read(authRepositoryProvider).resetPasswordForEmail(email: email),
      (err) => err is EIAuthException,
    );

    void setToLoading() => state = const AsyncLoading();

    return state.hasError == false;
  }
}
