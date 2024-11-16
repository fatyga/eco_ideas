import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';

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
    required this.onAddonChanged,
    super.key,
  });

  final EcoIdeaStep step;
  final void Function(EcoIdeaStep step) onChange;

  final void Function(EcoIdeaStepAddon updatedAddon) onAddonChanged;
  @override
  State<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends State<IdeaStepForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: ListView(
        children: [
          IdeaImageField(
            step: widget.step,
            onChange: widget.onChange,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 12),
                IdeaTitleField(
                  step: widget.step,
                  onChange: (updatedIdea) {
                    widget.onChange(updatedIdea);
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
                ...widget.step.availableAddonTypes.map((addonType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: IdeaStepAddonSection(
                      step: widget.step,
                      addonType: addonType,
                      onSubmit: (addon) {
                        final field = _formKey
                            .currentState!.fields[addon.fieldName]
                          ?..validate();

                        if (field != null && field.isValid) {
                          field.save();

                          widget.onAddonChanged(
                            addon.copyWith(value: field.value as String),
                          );
                        }
                      },
                      initialValues: widget.step.addons
                          .where(
                            (addon) => addon.type == addonType,
                          )
                          .toList(),
                    ),
                  );
                }),
                const SizedBox(height: 72),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
