// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaStepImpl _$$EcoIdeaStepImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaStepImpl(
      id: (json['id'] as num).toInt(),
      ideaId: json['ideaId'] as String,
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EcoIdeaStepImplToJson(_$EcoIdeaStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ideaId': instance.ideaId,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };
