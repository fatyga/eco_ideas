import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';

class IdeaStepForm extends StatefulWidget {
  const IdeaStepForm({required this.step, required this.onChanged, super.key});

  final IdeaStep step;
  final void Function(IdeaStep) onChanged;

  @override
  State<IdeaStepForm> createState() => _IdeaStepFormState();
}

class _IdeaStepFormState extends State<IdeaStepForm> {
  final _formKey = GlobalKey<FormState>();

  final _titleFieldController = TextEditingController();
  final _descriptionFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TitleField(
            controller: _titleFieldController,
            onChanged: (value) =>
                widget.onChanged(widget.step.copyWith(title: value)),
          ),
          DescriptionField(
            controller: _descriptionFieldController,
            onChanged: (value) =>
                widget.onChanged(widget.step.copyWith(description: value)),
          ),
        ],
      ),
    );
  }
}
