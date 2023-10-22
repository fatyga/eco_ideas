import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const path = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home')));
  }
}
