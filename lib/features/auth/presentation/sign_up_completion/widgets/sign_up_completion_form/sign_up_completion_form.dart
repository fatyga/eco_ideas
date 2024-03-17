import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/widgets/sign_up_completion_form/sign_up_completion_about_me_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/widgets/sign_up_completion_form/sign_up_completion_submit_button.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SignUpCompletionForm extends StatelessWidget {
  const SignUpCompletionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.signUpCompletionFormTitle,
            style: theme.textTheme.headlineMedium!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.signUpCompletionFormDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const SignUpCompletionUserAvatar(),
          const SizedBox(height: 16),
          const SignUpCompletionAboutMeField(),
          const SizedBox(height: 16),
          const SignUpCompletionSubmitButton()
        ],
      ),
    );
  }
}
