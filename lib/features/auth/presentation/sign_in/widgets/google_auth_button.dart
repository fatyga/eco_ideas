import 'package:eco_ideas/common/widgets/auth_provider_button.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AuthProviderButton(
      label: l10n.googleAuthButtonLabelText,
      logoAssetPath: 'assets/images/google-logo-9808.png',
      onPressed: onPressed,
    );
  }
}
