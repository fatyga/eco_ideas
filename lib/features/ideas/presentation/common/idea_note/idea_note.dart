import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_header.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_points.dart';
import 'package:flutter/material.dart';

class IdeaNote extends StatefulWidget {
  const IdeaNote({super.key});

  @override
  State<IdeaNote> createState() => _IdeaNoteState();
}

class _IdeaNoteState extends State<IdeaNote> {
  final points = <String>[];

  void addPoint() {
    setState(() {
      points.add('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IdeaNoteHeader(
          icon: const Icon(Icons.circle_outlined),
          text: 'What you will need:',
          onAddIconTap: addPoint,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 28),
          child: IdeaNotePoints(points: points),
        ),
      ],
    );
  }
}
