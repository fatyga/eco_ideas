import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step.freezed.dart';
part 'eco_idea_step.g.dart';

@freezed
class EcoIdeaStep with _$EcoIdeaStep {
  const factory EcoIdeaStep({
    required int id,
    @JsonKey(name: 'idea_id') required String ideaId,
    @Default('') String title,
    @Default('') String description,
    @Default(null) String? imageId,
    @JsonKey(includeToJson: false)
    @Default(
      [],
    )
    List<EcoIdeaStepAddon> addons,
  }) = _EcoIdeaStep;

  factory EcoIdeaStep.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaStepFromJson(json);

  factory EcoIdeaStep.empty({required int id, required String ideaId}) =>
      EcoIdeaStep(
        id: id,
        ideaId: ideaId,
      );
}
