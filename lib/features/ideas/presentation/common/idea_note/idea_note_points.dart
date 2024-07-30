import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_point.dart';
import 'package:flutter/material.dart';

class IdeaNotePoints extends StatelessWidget {
  const IdeaNotePoints({required this.points, super.key});

  final List<String> points;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: points
          .map(
            (point) => IdeaNotePoint(
              point: point,
            ),
          )
          .toList(),
    );
  }
}
