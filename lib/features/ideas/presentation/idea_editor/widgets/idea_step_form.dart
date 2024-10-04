import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/description_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/image_field.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/title_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IdeaStepForm extends StatefulWidget {
  const IdeaStepForm({required this.step, required this.onChange, super.key});

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
            onSubmit: () {
              final isValid = _formKey.currentState!.fields[IdeaImageField.name]
                  ?.validate();

              if (isValid != null && isValid) {
                _formKey.currentState!.fields[IdeaImageField.name]!.save();
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
                    final isValid = _formKey
                        .currentState!.fields[IdeaTitleField.name]
                        ?.validate();
                    if (isValid != null && isValid) {
                      _formKey.currentState!.fields[IdeaTitleField.name]!
                          .save();
                      widget.onChange(
                        widget.step.copyWith(
                          title: _formKey.currentState!
                              .fields[IdeaTitleField.name]!.value as String,
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
                    final isValid = _formKey
                        .currentState!.fields[IdeaDescriptionField.name]
                        ?.validate();
                    if (isValid != null && isValid) {
                      _formKey.currentState!.fields[IdeaDescriptionField.name]!
                          .save();

                      widget.onChange(
                        widget.step.copyWith(
                          description: _formKey
                              .currentState!
                              .fields[IdeaDescriptionField.name]!
                              .value as String,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
