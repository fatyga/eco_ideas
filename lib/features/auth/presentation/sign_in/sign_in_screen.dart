import 'package:eco_ideas/common_widgets/greeting_title.dart';
import 'package:eco_ideas/common_widgets/labeled_divider.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/register_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/sign_in_form.dart';
import 'package:eco_ideas/l10n/l10n.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const path = '/signIn';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const GreetingTitle(),
            const SignInForm(),
            LabeledDivider(labelText: l10n.signInLabeledDividerText),
            Center(child: RegisterActionButton(onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
