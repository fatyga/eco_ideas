import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_header.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_manager.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_note/idea_note_points.dart';
import 'package:flutter/material.dart';

class IdeaNote extends StatefulWidget {
  const IdeaNote({super.key});

  @override
  State<IdeaNote> createState() => _IdeaNoteState();
}

class _IdeaNoteState extends State<IdeaNote> {
  List<String> subpoints = <String>[];

  Future<List<String>?> showIdeaNoteManager() async => showDialog<List<String>>(
        context: context,
        builder: (context) => IdeaNoteManager(
          subpoints: subpoints,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IdeaNoteHeader(
          icon: const Icon(Icons.circle_outlined),
          text: 'What you will need:',
          onEditIconTap: () async {
            final modifiedSubpoints = await showIdeaNoteManager();
            if (modifiedSubpoints != null) {
              setState(() {
                subpoints = modifiedSubpoints;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 28),
          child: IdeaNotePoints(points: subpoints),
        ),
      ],
    );
  }
}
