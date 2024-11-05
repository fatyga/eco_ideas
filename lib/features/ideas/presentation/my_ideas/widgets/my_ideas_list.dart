import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:flutter/material.dart';

class MyIdeasList extends StatelessWidget {
  const MyIdeasList({required this.ideas, super.key});

  final List<EcoIdeaStep> ideas;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ideas.map((idea) {
        return ListTile(title: Text(idea.title));
      }).toList(),
    );
  }
}
