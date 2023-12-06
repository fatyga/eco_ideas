import 'package:eco_ideas/common/widgets/indicator_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';

import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_state.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(
      signUpControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final isSigningIn = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    final canAttemptSigningIn = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.valueOrNull?.isValid),
    );
    return IndicatorButton(
      isLoading: isSigningIn,
      onPressed: isSigningIn || canAttemptSigningIn == null
          ? null
          : canAttemptSigningIn
              ? ref.read(signUpControllerProvider.notifier).signUpWithEmail
              : null,
      child: Text(l10n.signUpButtonText),
    );
  }
}
