// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaImpl _$$EcoIdeaImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      isDraft: json['is_draft'] as bool,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => EcoIdeaStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EcoIdeaImplToJson(_$EcoIdeaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'is_draft': instance.isDraft,
      'steps': instance.steps,
    };
