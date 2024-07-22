import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
    ]);
  }
}
