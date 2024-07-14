import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step.freezed.dart';

@freezed
class EcoIdeaStep with _$EcoIdeaStep {
  const factory EcoIdeaStep({
    required String image,
    required String title,
    @Default([]) List<String> notes,
    @Default([]) List<String> tips,
  }) = _EcoIdeaStep;
}
