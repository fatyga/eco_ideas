import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_editor.dart';
import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_header.dart';

import 'package:eco_ideas/features/ideas/presentation/common/idea_section/idea_section_subpoints.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum IdeaSectionType {
  requirments,
  benefits;

  String name(AppLocalizations l10n) => switch (this) {
        IdeaSectionType.requirments => l10n.ideaRequirmentsSectionName,
        IdeaSectionType.benefits => l10n.ideaBenefitsSectionName,
      };
}

class IdeaSection extends StatefulWidget {
  const IdeaSection({required this.sectionType, super.key});

  final IdeaSectionType sectionType;

  @override
  State<IdeaSection> createState() => _IdeaSectionState();
}

class _IdeaSectionState extends State<IdeaSection> {
  List<String> subpoints = <String>[];

  Future<List<String>?> showIdeaNoteManager() async => showDialog<List<String>>(
        context: context,
        builder: (context) => IdeaSectionEditor(
          subpoints: subpoints,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        IdeaSectionHeader(
          icon: Icon(
            switch (widget.sectionType) {
              IdeaSectionType.requirments => Icons.info,
              IdeaSectionType.benefits => Icons.mood,
            },
          ),
          text: widget.sectionType.name(l10n),
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
