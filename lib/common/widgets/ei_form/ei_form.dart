import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class EIForm extends StatefulWidget {
  const EIForm({required this.inputs, required this.onSubmit, super.key});

  final VoidCallback onSubmit;
  final List<FormzInput<dynamic, dynamic>> inputs;

  @override
  State<EIForm> createState() => _EIFormState();
}

class _EIFormState extends State<EIForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(),
    );
  }
}
