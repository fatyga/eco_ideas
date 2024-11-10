// ignore_for_file: invalid_annotation_target

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'eco_idea_step_addon.freezed.dart';
part 'eco_idea_step_addon.g.dart';

enum IdeaStepAddonType {
  @JsonValue('benefit')
  benefit,
  @JsonValue('requirment')
  requirment,
  @JsonValue('tip')
  tip,
  @JsonValue('warning')
  warning;

  bool get isTip => this == IdeaStepAddonType.tip;
  bool get isWarning => this == IdeaStepAddonType.warning;
  bool get isRequirment => this == IdeaStepAddonType.requirment;
  bool get isBenefit => this == IdeaStepAddonType.benefit;

  String getTitle(AppLocalizations l10n) {
    return switch (this) {
      IdeaStepAddonType.tip => l10n.ideaStepTipAddonTitle,
      IdeaStepAddonType.warning => l10n.ideaStepWarningAddonTitle,
      IdeaStepAddonType.benefit => l10n.ideaStepBenefitAddonTitle,
      IdeaStepAddonType.requirment => l10n.ideaStepRequirmentAddonTitle,
    };
  }

  IconData getIcon() {
    return switch (this) {
      IdeaStepAddonType.tip => Icons.tips_and_updates,
      IdeaStepAddonType.warning => Icons.warning_amber,
      IdeaStepAddonType.requirment => Icons.task_alt,
      IdeaStepAddonType.benefit => Icons.health_and_safety_sharp
    };
  }

  MaterialColor getColor() {
    return switch (this) {
      IdeaStepAddonType.tip => Colors.green,
      IdeaStepAddonType.warning => Colors.red,
      IdeaStepAddonType.requirment => Colors.teal,
      IdeaStepAddonType.benefit => Colors.blue,
    };
  }
}

@freezed
class EcoIdeaStepAddon with _$EcoIdeaStepAddon {
  const factory EcoIdeaStepAddon({
    required int id,
    @JsonKey(name: 'type') required IdeaStepAddonType type,
    @JsonKey(name: 'step_id') required int stepId,
    @JsonKey(name: 'idea_id') required String ideaId,
    required String value,
  }) = _EcoIdeaStep;
  factory EcoIdeaStepAddon.fromJson(Map<String, dynamic> json) =>
      _$EcoIdeaStepAddonFromJson(json);

  const EcoIdeaStepAddon._();
  String get fieldName => '$this.id.${type.name}.$this.stepId.$this.ideaId';
}
