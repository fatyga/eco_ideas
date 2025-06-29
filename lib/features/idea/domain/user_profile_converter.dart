import 'package:eco_ideas/features/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

class UserProfileConverter
    implements JsonConverter<UserProfile, Map<String, dynamic>> {
  const UserProfileConverter();

  @override
  UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserProfile userProfile) => userProfile.toJson();
}
