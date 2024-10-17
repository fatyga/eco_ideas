// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea_step_addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaStepImpl _$$EcoIdeaStepImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaStepImpl(
      id: (json['id'] as num).toInt(),
      addonType: json['addon_type'] as String,
      stepId: json['step_id'] as String,
      ideaId: json['idea_id'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$EcoIdeaStepImplToJson(_$EcoIdeaStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addon_type': instance.addonType,
      'step_id': instance.stepId,
      'idea_id': instance.ideaId,
      'value': instance.value,
    };
