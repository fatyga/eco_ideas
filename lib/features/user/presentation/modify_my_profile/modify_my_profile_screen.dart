import 'package:flutter/material.dart';

class ModifyMyProfileScreen extends StatelessWidget {
  const ModifyMyProfileScreen({super.key});

  static String path => 'modify';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Modify your profile")));
  }
}
