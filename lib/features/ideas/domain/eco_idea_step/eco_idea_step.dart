// ignore_for_file: invalid_annotation_target

import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    @JsonKey(name: 'image_id') @Default(null) String? imageId,
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
  const EcoIdeaStep._();

  String? get imageUrl => imageId == null
      ? null
      : '${dotenv.env['IDEA_STEP_IMAGE_URL_BASE']}/$ideaId/$imageId.png';

  List<IdeaStepAddonType> get availableAddonTypes {
    if (id == 0) {
      return IdeaStepAddonType.values;
    } else {
      return [IdeaStepAddonType.tip, IdeaStepAddonType.warning];
    }
  }
}
