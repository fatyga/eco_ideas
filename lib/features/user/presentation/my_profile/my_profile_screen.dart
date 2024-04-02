import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static const path = 'myProfile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('My profile')));
  }
}
