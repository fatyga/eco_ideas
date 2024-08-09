import 'package:eco_ideas/features/ideas/presentation/idea_creator/form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

class IdeaCreatorScreen extends StatelessWidget {
  const IdeaCreatorScreen({super.key});

  static const String routePath = 'create';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 48, left: 8, right: 8),
        children: [
          IdeaCreatorFrom(),
        ],
      ),
    );
  }
}
