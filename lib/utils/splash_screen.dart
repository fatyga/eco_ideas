import 'package:eco_ideas/app_logo.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogo(),
            context.spaces.verticalLarge,
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
