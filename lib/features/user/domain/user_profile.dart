import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String username,
    @JsonKey(name: 'full_name') String? fullName,
    String? bio,
    String? avatarUrl,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}
