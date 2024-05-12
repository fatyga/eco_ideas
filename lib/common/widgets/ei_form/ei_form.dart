import 'package:eco_ideas/common/widgets/ei_form/form_models/ei_form_model.dart';
import 'package:flutter/material.dart';

class EIForm extends StatefulWidget {
  const EIForm({required this.formModel, super.key});

  final EIFormModel formModel;
  @override
  State<EIForm> createState() => _EIFormState();
}

class _EIFormState extends State<EIForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          children: widget.formModel.inputs.map((input) {
        if (input.value is String) {}
        return SizedBox();
      }).toList()),
    );
  }
}
