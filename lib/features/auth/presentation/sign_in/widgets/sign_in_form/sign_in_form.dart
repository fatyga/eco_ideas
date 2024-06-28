import 'package:eco_ideas/common/extensions/snackbar_on_error.dart';
import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/form_fields/email_field.dart';
import 'package:eco_ideas/features/auth/presentation/form_fields/password_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';

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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final isLoading =
        ref.watch(signInControllerProvider.select((state) => state.isLoading));

    ref.listen(
      signInControllerProvider,
      (_, next) => next.showSnackBarOnError(context),
    );
    return FormBuilder(
      key: _formKey,
      enabled: !isLoading,
      child: Column(
        children: [
          const EmailField(),
          const SizedBox(height: 16),
          const PasswordField(),
          const SizedBox(height: 4),
          const Align(
            alignment: Alignment.centerRight,
            child: ForgotPasswordActionButton(),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            isLoading: isLoading,
            onPressed: () async {
              final isValid = _formKey.currentState?.saveAndValidate();

              if (isValid != null && isValid) {
                await ref.read(signInControllerProvider.notifier).submit(
                      _formKey.currentState!.fields['email']!.value as String,
                      _formKey.currentState!.fields['password']!.value
                          as String,
                    );
              }
            },
            child: Text(l10n.signInButtonText),
          ),
        ],
      ),
    );
  }
}
