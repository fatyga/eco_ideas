import 'package:eco_ideas/common/widgets/indicator_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    ref.listen(
      signInControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final isSigningIn = ref.watch(signInControllerProvider).isLoading;
    final isValid = ref.watch(
      signInControllerProvider
          .select((controllerState) => controllerState.value!.isValid),
    );
    return IndicatorButton(
      isLoading: isSigningIn,
      onPressed: isSigningIn || !isValid
          ? null
          : ref.read(signInControllerProvider.notifier).signInWithEmail,
      child: Text(l10n.signInButtonText),
    );
  }
}
