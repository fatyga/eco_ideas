// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaImpl _$$EcoIdeaImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$EcoIdeaImplToJson(_$EcoIdeaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
    };
