import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step.freezed.dart';
part 'eco_idea_step.g.dart';

@freezed
class EcoIdeaStep with _$EcoIdeaStep {
  const factory EcoIdeaStep({
    required String image,
    required String title,
  }) = _EcoIdeaStep;

  factory EcoIdeaStep.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaStepFromJson(json);
}
