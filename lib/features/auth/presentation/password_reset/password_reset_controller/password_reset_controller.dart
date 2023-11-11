import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_reset_controller.g.dart';

@riverpod
class PasswordResetController extends _$PasswordResetController {
  @override
  FutureOr<void> build() {}

  Future<void> resetPasswordForEmail() async {
      await ref.read(authRepositoryProvider).resetPasswordForEmail(email: 'michal_fatyga@protonmail.com');
  }
}
