import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/modify_my_profile_controller/modify_my_profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'modify_my_profile_controller.g.dart';

@riverpod
class ModifyMyProfileController extends _$ModifyMyProfileController {
  @override
  ModifyMyProfileState build() {
    final userProfile = ref.read(userProfileChangesProvider).valueOrNull;
    if (userProfile != null) {
      return ModifyMyProfileState.fromUserProfile(userProfile);
    }
    return const ModifyMyProfileState();
  }
}
