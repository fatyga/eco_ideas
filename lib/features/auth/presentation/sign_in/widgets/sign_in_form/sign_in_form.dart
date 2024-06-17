import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailFocusNode,
    required this.passwordFocusNode,
    super.key,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilder(
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'email',
            decoration:
                InputDecoration(labelText: l10n.emailTextFieldLabelText),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: l10n.requiredValidatorErrorText,
              ),
              FormBuilderValidators.email(),
            ]),
          ),
          FormBuilderTextField(
            name: 'password',
            decoration:
                InputDecoration(labelText: l10n.passwordTextFieldLabelText),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: l10n.requiredValidatorErrorText,
              ),
              FormBuilderValidators.minLength(8),
            ]),
          ),
          FormBuilderTextField(
            name: 'passwordRetype',
            enabled: _formKey.currentState?.fields['password']?.valueIsValid ??
                false,
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: l10n.requiredValidatorErrorText,
              ),
              FormBuilderValidators.minLength(8),
              FormBuilderValidators.equal<String>(
                _formKey.currentState!.fields['password']!.value as String,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
