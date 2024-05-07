import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/about_me_input.dart';
import 'package:eco_ideas/common/widgets/ei_form/input_models/input_models/avatar_input.dart';
import 'package:eco_ideas/features/user/presentation/modify_my_profile/modify_my_profile_controller/modify_my_profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'modify_my_profile_controller.g.dart';

@riverpod
class ModifyMyProfileController extends _$ModifyMyProfileController {
  @override
  FutureOr<ModifyMyProfileState> build() {
    final userProfile = ref.read(userProfileChangesProvider).valueOrNull;
    if (userProfile != null) {
      return ModifyMyProfileState.fromUserProfile(userProfile);
    }
    return const ModifyMyProfileState();
  }

  void updateAvatarInput(String? avatarUrl) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      state = AsyncValue.data(
        stateValue.copyWith(
          avatarInput: AvatarInput.dirty(value: avatarUrl),
        ),
      );
    }
  }

  void updateAboutMeInput(String newValue) {
    final stateValue = state.valueOrNull;
    if (stateValue != null) {
      if (newValue.isEmpty) {
        const input = AboutMeInput.pure();

        state = AsyncData<ModifyMyProfileState>(
          stateValue.copyWith(aboutMeInput: input),
        );
      } else {
        final input = AboutMeInput.dirty(value: newValue);

        state = AsyncData<ModifyMyProfileState>(
          stateValue.copyWith(aboutMeInput: input),
        );
      }
    }
  }
}
