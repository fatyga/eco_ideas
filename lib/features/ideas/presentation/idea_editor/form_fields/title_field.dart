import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaTitleField extends ConsumerStatefulWidget {
  const IdeaTitleField({required this.onSubmit, this.initialValue, super.key});

  static const String name = 'title';
  final String? initialValue;
  final void Function() onSubmit;

  @override
  ConsumerState<IdeaTitleField> createState() => _IdeaTitleFieldState();
}

class _IdeaTitleFieldState extends ConsumerState<IdeaTitleField> {
  late AsyncValue<String?> submission;

  @override
  void initState() {
    submission = AsyncData<String?>(widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Focus(
      onFocusChange: (value) {
        if (!value) widget.onSubmit();
      },
      child: FormBuilderTextField(
        name: IdeaTitleField.name,
        initialValue: widget.initialValue,
        onEditingComplete: widget.onSubmit,
        decoration:
            InputDecoration(labelText: l10n.ideaStepTitleFieldLabelText),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: l10n.requiredValidatorErrorText,
          ),
        ]),
      ),
    );
  }
}
