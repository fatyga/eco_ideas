import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/email_field.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetEmailForm extends ConsumerStatefulWidget {
  const PasswordResetEmailForm({required this.onSubmit, super.key});

  final VoidCallback onSubmit;
  @override
  ConsumerState<PasswordResetEmailForm> createState() =>
      _PasswordResetEmailFormState();
}

class _PasswordResetEmailFormState
    extends ConsumerState<PasswordResetEmailForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

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
        isLoading = true;
      });

      try {
        final success = await ref
            .read(authRepositoryProvider)
            .resetPasswordForEmail(
              email: _formKey.currentState!.fields['email']!.value as String,
            );
        if (success) widget.onSubmit();
      } on PasswordResetLinkSendFailException catch (error) {
        _showSnackbarWithError(error);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilder(
      key: _formKey,
      enabled: !isLoading,
      child: Column(
        children: [
          Text(l10n.passwordResetFirstStepDescription),
          const SizedBox(height: 8),
          const EmailField(
            key: ValueKey('passwordResetFirstStepFormEmailField'),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            isLoading: isLoading,
            onPressed: submit,
            child: Text('submit'),
          ),
        ],
      ),
    );
  }
}
