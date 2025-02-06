import 'package:eco_ideas/l10n/l10n.dart';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO(fatyga): change name of this widget to more meaningful
// TODO(fatyga): set correct color of top border
class SignInScreenFooter extends StatelessWidget {
  const SignInScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => context.go('/signIn/passwordResetFirstStep'),
          child: Text(l10n.signInScreenFooter_forgotPassword),
        ),
        FilledButton.tonal(
          onPressed: () => context.go('/signIn/signUp'),
          child: Text(
            l10n.signInScreenFooter_createAccount,
          ),
        ),
      ],
    );
  }
}
