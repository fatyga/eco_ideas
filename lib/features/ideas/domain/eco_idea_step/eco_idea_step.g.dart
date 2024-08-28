// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaStepImpl _$$EcoIdeaStepImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaStepImpl(
      type: $enumDecode(_$EcoIdeaStepTypeEnumMap, json['type']),
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EcoIdeaStepImplToJson(_$EcoIdeaStepImpl instance) =>
    <String, dynamic>{
      'type': _$EcoIdeaStepTypeEnumMap[instance.type]!,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };

const _$EcoIdeaStepTypeEnumMap = {
  EcoIdeaStepType.introduction: 'introduction',
  EcoIdeaStepType.standard: 'standard',
  EcoIdeaStepType.summary: 'summary',
};
