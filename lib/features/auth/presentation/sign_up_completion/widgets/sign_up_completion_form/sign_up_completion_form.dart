import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/about_me_field.dart';
import 'package:eco_ideas/features/auth/presentation/common/form_fields/user_avatar_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpCompletionForm extends ConsumerStatefulWidget {
  const SignUpCompletionForm({super.key});

  @override
  ConsumerState<SignUpCompletionForm> createState() =>
      _SignUpCompletionFormState();
}

class _SignUpCompletionFormState extends ConsumerState<SignUpCompletionForm> {
  bool isProcessing = false;

  Future<void> submit() async {}
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
          const UserAvatarField(),
          const SizedBox(height: 16),
          const AboutMeField(),
          const SizedBox(height: 16),
          PrimaryButton(
            isLoading: isProcessing,
            onPressed: submit,
            child: Text(l10n.signUpCompletionDoneButtonText),
          ),
        ],
      ),
    );
  }
}
