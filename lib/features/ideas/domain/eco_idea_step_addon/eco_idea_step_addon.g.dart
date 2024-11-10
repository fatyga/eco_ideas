// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eco_idea_step_addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EcoIdeaStepImpl _$$EcoIdeaStepImplFromJson(Map<String, dynamic> json) =>
    _$EcoIdeaStepImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$IdeaStepAddonTypeEnumMap, json['type']),
      stepId: (json['step_id'] as num).toInt(),
      ideaId: json['idea_id'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$EcoIdeaStepImplToJson(_$EcoIdeaStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$IdeaStepAddonTypeEnumMap[instance.type]!,
      'step_id': instance.stepId,
      'idea_id': instance.ideaId,
      'value': instance.value,
    };

const _$IdeaStepAddonTypeEnumMap = {
  IdeaStepAddonType.benefit: 'benefit',
  IdeaStepAddonType.requirment: 'requirment',
  IdeaStepAddonType.tip: 'tip',
  IdeaStepAddonType.warning: 'warning',
};
