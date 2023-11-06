import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const path = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('SignUp')));
  }
}
