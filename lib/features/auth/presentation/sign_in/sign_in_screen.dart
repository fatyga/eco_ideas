import 'package:eco_ideas/common_widgets/greeting_title.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/sign_in_form.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const path = '/signIn';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GreetingTitle(),
            SignInForm(),
          ],
        ),
      ),
    );
  }
}
