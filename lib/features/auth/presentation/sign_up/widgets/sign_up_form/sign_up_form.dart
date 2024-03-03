import 'package:eco_ideas/features/auth/presentation/presentation.dart';

import 'package:flutter/widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SignUpUsernameField(),
        SizedBox(height: 12),
        SignUpEmailField(),
        SizedBox(height: 12),
        SignUpPasswordField(),
        SizedBox(height: 12),
        SignUpPasswordRetypeField(),
        SizedBox(height: 12),
        SignUpButton(),
      ],
    );
  }
}
