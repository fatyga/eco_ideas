import 'dart:io';

import 'package:eco_ideas/features/user/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_user_profile_controller.g.dart';

@riverpod
class EditUserProfileController extends _$EditUserProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> updateUserProfile(
    String userId,
    Map<String, dynamic> changedFields,
  ) async {
    final userRepository = ref.read(userRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => userRepository.updateUserProfile(userId, changedFields),
    );
  }

  Future<void> uploadAvatar(String userId, XFile imageFile) async {
    final userRepository = ref.read(userRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => userRepository.uploadAvatar(userId, imageFile),
    );
  }
}
