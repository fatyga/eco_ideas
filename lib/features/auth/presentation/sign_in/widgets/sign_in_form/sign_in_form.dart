import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: <Widget>[
          EmailField(),
          SizedBox(height: 12),
          PasswordField(),
          SizedBox(height: 12),
          SignInButton(),
        ],
      ),
    );
  }
}
