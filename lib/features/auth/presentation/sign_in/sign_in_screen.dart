import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const path = '/signIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('SignIn')));
  }
}
