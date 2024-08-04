import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_subpoint.dart';
import 'package:flutter/material.dart';

class IdeaSectionSubpoints extends StatelessWidget {
  const IdeaSectionSubpoints({required this.points, super.key});

  final List<String> points;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: points
          .map(
            (point) => IdeaSectionSubpoint(
              point: point,
            ),
          )
          .toList(),
    );
  }
}
