import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'eco_idea.freezed.dart';
part 'eco_idea.g.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea({
    required String id,
    required String creatorId,
    required String title,
    required String description,
    @Default(<EcoIdeaStep>[]) List<EcoIdeaStep> steps,
  }) = _EcoIdea;

  factory EcoIdea.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaFromJson(json);
}
