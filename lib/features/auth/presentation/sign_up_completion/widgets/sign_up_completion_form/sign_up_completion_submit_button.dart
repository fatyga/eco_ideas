import 'package:eco_ideas/common/widgets/primary_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_state.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpCompletionSubmitButton extends ConsumerWidget {
  const SignUpCompletionSubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoading = ref.watch(
      signUpCompletionControllerProvider.select((state) => state.isLoading),
    );

    final canAttemptSigningUpCompletion = ref.watch(
      signUpCompletionControllerProvider
          .select((state) => state.valueOrNull?.isValid),
    );
    return PrimaryButton(
      isLoading: isLoading,
      onPressed: isLoading || canAttemptSigningUpCompletion == null
          ? null
          : canAttemptSigningUpCompletion
              ? ref
                  .read(signUpCompletionControllerProvider.notifier)
                  .completeSignUp
              : null,
      child: Text(l10n.signUpCompletionFormSubmitButton),
    );
  }
}
