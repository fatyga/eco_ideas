import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';

class IdeaForm extends StatefulWidget {
  const IdeaForm({required this.idea, required this.onChanged, super.key});

  final Idea idea;
  final void Function(Idea) onChanged;

  @override
  State<IdeaForm> createState() => _IdeaFormState();
}

class _IdeaFormState extends State<IdeaForm> {
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
              onChanged: (value) {
                widget.onChanged(widget.idea.copyWith(title: value));
              }),
          DescriptionField(
              controller: _descriptionFieldController,
              onChanged: (value) {
                widget.onChanged(widget.idea.copyWith(description: value));
              }),
        ],
      ),
    );
  }
}
