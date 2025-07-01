part of 'idea_addon.dart';

class _IdeaAddonItems extends StatelessWidget {
  const _IdeaAddonItems({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (value) => Padding(
              padding: context.paddings.verticalSmall,
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 8),
                  context.spaces.horizontalStandard,
                  Text(value),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
