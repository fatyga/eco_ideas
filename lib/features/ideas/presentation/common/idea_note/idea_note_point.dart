import 'package:flutter/material.dart';

enum IdeaNotePointMode { view, edit }

class IdeaNotePoint extends StatelessWidget {
  const IdeaNotePoint({required this.point, super.key});

  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 6),
        const SizedBox(width: 8),
        Text(point),
      ],
    );
  }
}
