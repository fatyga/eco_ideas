import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const path = 'signUp';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.signUpScreenAppBarTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [SignUpForm()]),
      ),
    );
  }
}
