import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

typedef UserProfileId = String;

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required UserProfileId id,
    required String username,
    @JsonKey(name: 'is_avatar_present') required bool isAvatarPresent,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  String? get avatarUrl =>
      isAvatarPresent ? '${dotenv.env['AVATAR_BASE_URL']}/$id/avatar' : null;
}
