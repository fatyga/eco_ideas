import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FilledButton(onPressed: () {}, child: Text(l10n.signInButtonText));
  }
}
