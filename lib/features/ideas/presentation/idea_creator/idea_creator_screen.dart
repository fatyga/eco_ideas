import 'package:eco_ideas/features/ideas/presentation/idea_creator/form.dart';
import 'package:flutter/material.dart';

class IdeaCreatorScreen extends StatelessWidget {
  const IdeaCreatorScreen({super.key});

  static const String routePath = 'create';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Text(
              "Let's create something great!",
              style: theme.textTheme.headlineSmall!
                  .copyWith(color: theme.colorScheme.primary),
            ),
          ),
          IdeaCreatorFrom(),
        ],
      ),
    );
  }
}
