// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      isAvatarPresent: json['is_avatar_present'] as bool,
      isSignUpCompleted: json['sign_up_completed'] as bool,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'is_avatar_present': instance.isAvatarPresent,
      'sign_up_completed': instance.isSignUpCompleted,
    };
