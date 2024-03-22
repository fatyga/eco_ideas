// ignore_for_file: invalid_annotation_target

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

typedef UserProfileId = String;

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(includeToJson: false) required UserProfileId id,
    required String username,
    @JsonKey(name: 'about_me') required String? aboutMe,
    @JsonKey(name: 'sign_up_completed') required bool signUpCompleted,
  }) = _UserProfile;
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  const UserProfile._();

  String get avatarUrl => '${dotenv.env['AVATAR_URL_BASE']}/$id/avatar';
}
