import 'dart:io';

import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/addon_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/title_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_addon_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepForm extends StatefulWidget {
  const IdeaStepForm({
    required this.step,
    required this.onChange,
    required this.onImageChanged,
    required this.onAddonChanged,
    super.key,
  });

  final EcoIdeaStep step;
  final void Function(EcoIdeaStep step) onChange;
  final void Function(File image) onImageChanged;
  final void Function(EcoIdeaStepAddon updatedAddon) onAddonChanged;
  @override
  State<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends State<IdeaStepForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    print(_formKey.currentState?.fields);
    return FormBuilder(
      key: _formKey,
      child: ListView(
        children: [
          IdeaImageField(
            onSubmit: () {
              final field = _formKey.currentState!.fields[IdeaImageField.name]
                ?..validate();

              if (field != null && field.isValid) {
                field.save();
                widget.onImageChanged(File(field.value as String));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 12),
                IdeaTitleField(
                  key: ValueKey('ideaStep${widget.step.id}FormTitleField'),
                  initialValue: widget.step.title,
                  onSubmit: () {
                    final field = _formKey
                        .currentState!.fields[IdeaTitleField.name]
                      ?..validate();

                    if (field != null &&
                        field.isValid &&
                        field.value != widget.step.title) {
                      field.save();
                      widget.onChange(
                        widget.step.copyWith(
                          title: field.value as String,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                IdeaDescriptionField(
                  key:
                      ValueKey('ideaStep${widget.step.id}FormDescriptionField'),
                  initialValue: widget.step.description,
                  onSubmit: () {
                    final field = _formKey
                        .currentState!.fields[IdeaDescriptionField.name]
                      ?..validate();

                    if (field != null &&
                        field.isValid &&
                        field.value != widget.step.description) {
                      field.save();

                      widget.onChange(
                        widget.step.copyWith(
                          description: field.value as String,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                if (widget.step.id == 0) ...[
                  IdeaStepAddonSection(
                    step: widget.step,
                    addonType: IdeaStepAddonType.benefit,
                    onSubmit: (addonFieldName) {
                      final field = _formKey
                          .currentState!.fields[addonFieldName]
                        ?..validate();

                      if (field != null && field.isValid) {
                        field.save();

                        widget.onAddonChanged(
                          widget.step.addons
                              .firstWhere(
                                (addon) => addon.fieldName == addonFieldName,
                              )
                              .copyWith(value: field.value as String),
                        );
                      }
                    },
                    initialValues: widget.step.addons
                        .where(
                          (addon) => addon.type.isBenefit,
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  IdeaStepAddonSection(
                    step: widget.step,
                    addonType: IdeaStepAddonType.requirment,
                    onSubmit: (updatedAddon) {},
                    initialValues: widget.step.addons
                        .where(
                          (addon) => addon.type.isRequirment,
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                ],
                IdeaStepAddonSection(
                  step: widget.step,
                  addonType: IdeaStepAddonType.tip,
                  onSubmit: (values) {},
                  initialValues: widget.step.addons
                      .where((addon) => addon.type.isTip)
                      .toList(),
                ),
                const SizedBox(height: 16),
                IdeaStepAddonSection(
                  step: widget.step,
                  addonType: IdeaStepAddonType.warning,
                  onSubmit: (values) {},
                  initialValues: widget.step.addons
                      .where((addon) => addon.type.isWarning)
                      .toList(),
                ),
                const SizedBox(height: 72)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
