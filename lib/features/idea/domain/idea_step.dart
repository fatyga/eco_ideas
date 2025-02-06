import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_step.freezed.dart';

part 'idea_step.g.dart';

@freezed
class IdeaStep with _$IdeaStep {
  const factory IdeaStep({
    required String ideaId,
    String? title,
    String? description,
    String? imageUrl,
  }) = _IdeaStep;

  factory IdeaStep.fromJson(Map<String, Object?> json) =>
      _$IdeaStepFromJson(json);
}
