import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const path = 'signUp';
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => context.go(const AuthRoute().location),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.signUpScreenAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: const [SignUpForm()]),
        ),
      ),
    );
  }
}
