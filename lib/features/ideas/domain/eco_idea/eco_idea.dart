import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
part 'eco_idea.freezed.dart';
part 'eco_idea.g.dart';

@freezed
class EcoIdea with _$EcoIdea {
  const factory EcoIdea({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'is_draft') required bool isDraft,
    required List<EcoIdeaStep> steps,
  }) = _EcoIdea;

  factory EcoIdea.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaFromJson(json);

  factory EcoIdea.draft({
    required String userId,
  }) =>
      EcoIdea(id: const Uuid().v4(), userId: userId, isDraft: true);
}
