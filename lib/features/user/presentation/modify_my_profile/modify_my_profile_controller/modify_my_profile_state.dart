import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'modify_my_profile_state.freezed.dart';

@freezed
class ModifyMyProfileState with _$ModifyMyProfileState {
  const factory ModifyMyProfileState({
    @Default(AvatarInput.pure()) AvatarInput avatarInput,
    @Default(AboutMeInput.pure()) AboutMeInput aboutMeInput,
  }) = _ModifyMyProfileState;

  factory ModifyMyProfileState.fromUserProfile(UserProfile userProfile) {
    return ModifyMyProfileState(
      avatarInput: AvatarInput.dirty(value: userProfile.avatarUrl),
      aboutMeInput: AboutMeInput.dirty(value: userProfile.aboutMe ?? ''),
    );
  }
}
