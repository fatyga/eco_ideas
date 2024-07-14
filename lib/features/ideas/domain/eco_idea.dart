import 'package:eco_ideas/features/ideas/domain/eco_idea_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'eco_idea.freezed.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea(
      {required String image,
      required String creatorId,
      required String title,
      @Default(<EcoIdeaStep>[]) List<EcoIdeaStep> steps}) = _EcoIdea;
}
