import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm(
      {required this.emailFocusNode,
      required this.passwordFocusNode,
      super.key});

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          EmailField(
            focusNode: emailFocusNode,
          ),
          const SizedBox(height: 12),
          PasswordField(focusNode: passwordFocusNode),
          Container(
              padding: const EdgeInsets.only(top: 4),
              alignment: Alignment.centerRight,
              child: ForgotPasswordActionButton(onPressed: () {})),
          const SizedBox(height: 12),
          const SignInButton(),
        ],
      ),
    );
  }
}
