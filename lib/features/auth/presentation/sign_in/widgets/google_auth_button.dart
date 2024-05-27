import 'package:eco_ideas/common/widgets/auth_provider_button.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleAuthButton extends ConsumerWidget {
  const GoogleAuthButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return AuthProviderButton(
        label: l10n.googleAuthButtonLabelText,
        logoAssetPath: 'assets/images/google-logo-9808.png',
        onPressed: () {}
        // onPressed: ref.read(signInControllerProvider.notifier).signInWithGoogle,
        );
  }
}
