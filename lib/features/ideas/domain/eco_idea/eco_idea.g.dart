// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaImpl _$$EcoIdeaImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaImpl(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      steps: (json['steps'] as List<dynamic>?)
              ?.map((e) => EcoIdeaStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EcoIdeaStep>[],
    );

Map<String, dynamic> _$$EcoIdeaImplToJson(_$EcoIdeaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'title': instance.title,
      'description': instance.description,
      'steps': instance.steps,
    };
