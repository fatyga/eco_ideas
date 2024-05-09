import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class EIForm extends StatefulWidget {
  const EIForm({required this.formModel, super.key});

  final FormzMixin formModel;
  @override
  State<EIForm> createState() => _EIFormState();
}

class _EIFormState extends State<EIForm> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> _generateFields() {
    return [];
  }

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
