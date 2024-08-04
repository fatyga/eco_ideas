import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_manager.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_header.dart';

import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_subpoints.dart';
import 'package:flutter/material.dart';

class IdeaSection extends StatefulWidget {
  const IdeaSection({super.key});

  @override
  State<IdeaSection> createState() => _IdeaSectionState();
}

class _IdeaSectionState extends State<IdeaSection> {
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
        IdeaSectionHeader(
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
          child: IdeaSectionSubpoints(points: subpoints),
        ),
      ],
    );
  }
}
