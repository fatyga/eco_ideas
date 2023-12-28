import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

typedef UserProfileId = String;

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required UserProfileId id,
    required String username,
    required String avatarURL,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
