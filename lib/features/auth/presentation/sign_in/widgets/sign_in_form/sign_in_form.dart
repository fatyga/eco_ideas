import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const EmailField(),
          const SizedBox(height: 12),
          const PasswordField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ForgotPasswordActionButton(onPressed: () {}),
            ],
          ),
          const SizedBox(height: 12),
          const SignInButton(),
        ],
      ),
    );
  }
}
