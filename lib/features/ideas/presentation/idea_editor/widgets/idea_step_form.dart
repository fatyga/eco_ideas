import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/mutable_eco_idea_step.dart';

import 'package:eco_ideas/features/ideas/presentation/idea_editor/editor_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/editor_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/editor_fields/title_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/widgets/idea_step_addon_section.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepForm extends StatefulWidget {
  const IdeaStepForm({
    required this.step,
    required this.onChange,
    super.key,
  });

  final EcoIdeaStep step;
  final void Function(EcoIdeaStep step) onChange;

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
                  onChange: (updatedIdea) => widget.onChange(updatedIdea),
                ),
                const SizedBox(height: 12),
                IdeaDescriptionField(
                  step: widget.step,
                  onChange: (updatedIdea) => widget.onChange(updatedIdea),
                ),
                const SizedBox(height: 24),
                ...widget.step.availableAddonTypes.map((addonType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: IdeaStepAddonSection(
                      step: widget.step,
                      addonType: addonType,
                      onChange: (addon) {
                        widget.onChange(widget.step.withUpdatedAddon(addon));
                      },
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
