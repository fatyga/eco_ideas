import 'package:eco_ideas/features/ideas/domain/eco_idea/eco_idea.dart';
import 'package:flutter/material.dart';

class IdeaPresenterScreen extends StatelessWidget {
  const IdeaPresenterScreen({required this.idea, super.key});

  static const String path = 'ideaPresenter';
  final EcoIdea idea;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
