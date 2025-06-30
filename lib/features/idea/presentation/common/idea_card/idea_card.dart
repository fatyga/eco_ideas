import 'package:eco_ideas/features/idea/data/idea_repository.dart';
import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'idea_card_image.dart';

part 'idea_card_details.dart';

enum IdeaCardLayout { vertical, horizontal }

class IdeaCard extends ConsumerWidget {
  const IdeaCard({
    required this.idea,
    this.ideaCardLayout = IdeaCardLayout.horizontal,
    super.key,
  });

  final Idea idea;
  final IdeaCardLayout ideaCardLayout;

  double get _cardHeight => switch (ideaCardLayout) {
        IdeaCardLayout.vertical => 300,
        IdeaCardLayout.horizontal => 120,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SizedBox(
      height: _cardHeight,
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            ref.read(selectedIdeaProvider.notifier).state = idea;
            context.go('/ideaEditor');
          },
          child: Padding(
            padding: context.paddings.allStandard,
            child: Builder(
              builder: (context) {
                return switch (ideaCardLayout) {
                  IdeaCardLayout.vertical => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _IdeaCardImage(
                          imageUrl: idea.imageUrl,
                          ideaCardLayout: ideaCardLayout,
                        ),
                        context.spaces.verticalStandard,
                        Expanded(child: _IdeaCardDetails(idea: idea)),
                      ],
                    ),
                  IdeaCardLayout.horizontal => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _IdeaCardImage(
                          imageUrl: idea.imageUrl,
                          ideaCardLayout: ideaCardLayout,
                        ),
                        context.spaces.horizontalStandard,
                        Expanded(child: _IdeaCardDetails(idea: idea)),
                      ],
                    ),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
