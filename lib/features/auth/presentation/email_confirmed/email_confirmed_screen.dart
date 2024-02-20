import 'package:flutter/material.dart';

class EmailConfirmedScreen extends StatelessWidget {
  const EmailConfirmedScreen({super.key});

  static const String path = 'emailConfirmed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [Text('Your account is fully activated!')]));
  }
}
