import 'package:eco_ideas/features/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(includeToJson: false) required String id,
    @JsonKey(includeToJson: false) required String username,
    @JsonKey(name: ProfileTable.fullName) String? fullName,
    String? bio,
    @JsonKey(includeToJson: false, name: ProfileTable.avatarUrl)
    @JsonKey(name: ProfileTable.avatarUrl) String? avatarUrl,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}
