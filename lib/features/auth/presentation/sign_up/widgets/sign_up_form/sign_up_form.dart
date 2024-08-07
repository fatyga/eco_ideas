import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';

import 'package:eco_ideas/features/auth/presentation/common/form_fields/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/password_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/retype_password_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/username_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({required this.onSuccessSubmit, super.key});

  final VoidCallback onSuccessSubmit;
  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isProcessing = false;

  void _showSnackbarWithError(EIAuthException error) {
    if (!mounted) return;
    final l10n = context.l10n;
    final errorText = error.resolveMessageForUser(l10n);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorText)));
  }

  Future<void> submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      setState(() {
        isProcessing = true;
      });

      try {
        await ref.read(authRepositoryProvider).signUpWithEmail(
              email: _formKey.currentState!.fields[EmailField.name]!.value
                  as String,
              password: _formKey.currentState!.fields[PasswordField.name]!.value
                  as String,
              username: _formKey.currentState!.fields[UsernameField.name]!.value
                  as String,
            );
        widget.onSuccessSubmit();
      } on SignUpException catch (error) {
        _showSnackbarWithError(error);
        setState(() {
          isProcessing = false;
        });
      }

      setState(() {
        isProcessing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilder(
      key: _formKey,
      enabled: !isProcessing,
      child: Column(
        children: <Widget>[
          const UsernameField(key: ValueKey('signUpFormUsernameField')),
          const SizedBox(height: 12),
          const EmailField(key: ValueKey('signUpFormEmailField')),
          const SizedBox(height: 12),
          const PasswordField(
            key: ValueKey('signUpFormPasswordField'),
            restricted: true,
          ),
          const SizedBox(height: 12),
          const RetypePasswordField(
            key: ValueKey('signUpFormRetypePasswordField'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            isLoading: isProcessing,
            onPressed: submit,
            child: Text(l10n.signUpButtonText),
          ),
        ],
      ),
    );
  }
}
