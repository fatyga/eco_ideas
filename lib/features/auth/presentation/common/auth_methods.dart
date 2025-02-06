import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

// TODO(fatyga): add icons with right dimensions
/// Shows possible options for signing in and creating new account
class AuthMethods extends StatelessWidget {
  const AuthMethods({
    required this.onEmailSelected,
    required this.onGoogleSelected,
    required this.onFacebookSelected,
    super.key,
  });

  final VoidCallback onEmailSelected;

  final VoidCallback onGoogleSelected;
  final VoidCallback onFacebookSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton.icon(
          onPressed: onGoogleSelected,
          icon: Image.asset('assets/google_icon.png', width: 24, height: 24),
          label: Text(l10n.continueWithGoogle),
        ),
        OutlinedButton.icon(
          onPressed: onFacebookSelected,
          icon: Image.asset('assets/facebook_icon.png', width: 24, height: 24),
          label: Text(l10n.continueWithFacebook),
        ),
        OutlinedButton.icon(
          onPressed: onEmailSelected,
          icon: const Icon(Icons.email_outlined, size: 24),
          label: Text(l10n.continueWithEmail),
        ),
      ],
    );
  }
}
