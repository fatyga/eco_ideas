import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/password_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({
    required this.emailFocusNode,
    required this.passwordFocusNode,
    super.key,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  ConsumerState<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isProcessing = false;

  void _showSnackbarOnError(EIAuthException error) {
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
        await ref.read(authRepositoryProvider).signInWithEmail(
              email: _formKey.currentState!.fields['email']!.value as String,
              password:
                  _formKey.currentState!.fields['password']!.value as String,
            );
      } on SignInFail catch (error) {
        _showSnackbarOnError(error);
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
          const EmailField(key: ValueKey('signInFormEmailField')),
          const SizedBox(height: 16),
          const PasswordField(key: ValueKey('signInFormPasswordField')),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerRight,
            child: ForgotPasswordActionButton(),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            isLoading: isProcessing,
            onPressed: submit,
            child: Text(l10n.signInButtonText),
          ),
        ],
      ),
    );
  }
}
