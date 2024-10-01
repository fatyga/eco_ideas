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
  }) = _EcoIdea;

  factory EcoIdea.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EcoIdeaFromJson(json);

  factory EcoIdea.draft({
    required String profileId,
  }) {
    final id = const Uuid().v4();
    return EcoIdea(
      id: id,
      profileId: profileId,
      steps: [
        EcoIdeaStep(
          id: 0,
          ideaId: id,
        )
      ],
    );
  }
}
