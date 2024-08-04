import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/password_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/retype_password_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetSecondStepForm extends ConsumerStatefulWidget {
  const PasswordResetSecondStepForm({super.key});

  @override
  ConsumerState<PasswordResetSecondStepForm> createState() =>
      _PasswordResetSecondStepFormState();
}

class _PasswordResetSecondStepFormState
    extends ConsumerState<PasswordResetSecondStepForm> {
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
        await ref.read(authRepositoryProvider).setNewPassword(
              newPassword:
                  _formKey.currentState!.fields[PasswordField.name]! as String,
            );
      } on SetUpNewPasswordException catch (error) {
        _showSnackbarWithError(error);
      } finally {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return FormBuilder(
      key: _formKey,
      enabled: !isProcessing,
      child: Column(
        children: [
          Text(l10n.passwordResetSecondStepDescription),
          const SizedBox(height: 12),
          const PasswordField(
            key: ValueKey('passwordResetSecondStepFormPasswordField'),
          ),
          const SizedBox(height: 12),
          const RetypePasswordField(
            key: ValueKey('passwordResetSecondStepFormRetypePasswordField'),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            isLoading: isProcessing,
            onPressed: submit,
            child: Text(l10n.passwordResetConfirmButtonText),
          ),
        ],
      ),
    );
  }
}
