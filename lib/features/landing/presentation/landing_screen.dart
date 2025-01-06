import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          context.paddings.horizontalStandard + context.paddings.verticalLarge,
      child: const Column(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ),);
  }
}
