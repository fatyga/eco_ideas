import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step.freezed.dart';
part 'eco_idea_step.g.dart';

enum EcoIdeaStepType { introduction, standard, summary }

@freezed
class EcoIdeaStep with _$EcoIdeaStep {
  const factory EcoIdeaStep({
    @Default('') String image,
    @Default(EcoIdeaStepType.introduction) EcoIdeaStepType type,
    @Default('') String title,
    @Default('') String description,
  }) = _EcoIdeaStep;

  factory EcoIdeaStep.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaStepFromJson(json);
}
