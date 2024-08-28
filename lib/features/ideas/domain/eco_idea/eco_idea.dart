import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'eco_idea.freezed.dart';
part 'eco_idea.g.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea({
    required String id,
    @JsonKey(name: 'profile_id') required String profileId,
    required List<EcoIdeaStep> steps,
    required bool published,
  }) = _EcoIdea;

  factory EcoIdea.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaFromJson(json);

  factory EcoIdea.draft({
    required String profileId,
  }) =>
      EcoIdea(
        id: const Uuid().v4(),
        profileId: profileId,
        steps: [
          const EcoIdeaStep(type: EcoIdeaStepType.introduction),
        ],
        published: false,
      );
}
