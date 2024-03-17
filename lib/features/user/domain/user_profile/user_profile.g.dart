// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      aboutMe: json['about_me'] as String?,
      signUpCompleted: json['sign_up_completed'] as bool,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'about_me': instance.aboutMe,
      'sign_up_completed': instance.signUpCompleted,
    };
