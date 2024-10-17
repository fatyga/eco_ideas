import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step_addon.freezed.dart';
part 'eco_idea_step_addon.g.dart';

@freezed
class EcoIdeaStepAddon with _$EcoIdeaStepAddon {
  const factory EcoIdeaStepAddon({
    required int id,
    @JsonKey(name: 'addon_type') required String addonType,
    @JsonKey(name: 'step_id') required String stepId,
    @JsonKey(name: 'idea_id') required String ideaId,
    required String value,
  }) = _EcoIdeaStep;

  factory EcoIdeaStepAddon.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaStepAddonFromJson(json);
}
