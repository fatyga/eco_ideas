// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaStepImpl _$$EcoIdeaStepImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaStepImpl(
      id: (json['id'] as num).toInt(),
      ideaId: json['idea_id'] as String,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageId: json['imageId'] as String? ?? null,
      addons: (json['addons'] as List<dynamic>?)
              ?.map((e) => EcoIdeaStepAddon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EcoIdeaStepImplToJson(_$EcoIdeaStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idea_id': instance.ideaId,
      'title': instance.title,
      'description': instance.description,
      'imageId': instance.imageId,
    };
