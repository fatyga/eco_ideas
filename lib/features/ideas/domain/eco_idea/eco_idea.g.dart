// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaImpl _$$EcoIdeaImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaImpl(
      id: json['id'] as String,
      profileId: json['profile_id'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => EcoIdeaStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      published: json['published'] as bool,
    );

Map<String, dynamic> _$$EcoIdeaImplToJson(_$EcoIdeaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_id': instance.profileId,
      'steps': instance.steps,
      'published': instance.published,
    };
