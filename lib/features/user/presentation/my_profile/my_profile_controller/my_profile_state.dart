import 'package:eco_ideas/features/user/domain/user_profile/user_profile.dart';
import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_profile_state.freezed.dart';

@freezed
class MyProfileState with _$MyProfileState {
  const factory MyProfileState({
    required UserProfile userProfile,
    UserAvatar? userAvatar,
  }) = _MyProfileState;
}
