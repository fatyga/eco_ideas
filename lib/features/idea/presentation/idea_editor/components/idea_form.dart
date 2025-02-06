import 'package:eco_ideas/features/idea/idea.dart';
import 'package:flutter/material.dart';

class IdeaForm extends StatefulWidget {
  const IdeaForm({required this.idea,  super.key});

  final Idea idea;


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
          TitleField(controller: _titleFieldController),
          DescriptionField(controller: _descriptionFieldController),
        ],
      ),
    );
  }
}
