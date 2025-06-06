import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class IdeaAddon extends StatefulWidget {
  const IdeaAddon({
    required this.title,
    required this.icon,
    required this.values,
    required this.onConfirm,
    super.key,
  });

  final String title;
  final Widget icon;
  final List<String> values;
  final void Function(List<String>) onConfirm;

  @override
  State<IdeaAddon> createState() => _IdeaAddonState();
}

class _IdeaAddonState extends State<IdeaAddon> {
  bool isContentVisible = true;

  void _toggleVisibility() {
    setState(() {
      isContentVisible = !isContentVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainerLow,
      child: Padding(
        padding: context.paddings.allSmall,
        child: Column(
          children: [
            _IdeaAddonHeader(
              title: widget.title,
              icon: widget.icon,
              isContentVisible: widget.values.isEmpty ? null : isContentVisible,
              onEditTap: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => IdeaAddonEditorDialog(
                    title: widget.title,
                    values: widget.values,
                    onConfirm: widget.onConfirm,
                  ),
                );
              },
              onVisibilityToggle: _toggleVisibility,
            ),
            if (widget.values.isNotEmpty && isContentVisible)
              Padding(
                padding: context.paddings.horizontalLarge,
                child: _IdeaAddonValues(values: widget.values),
              ),
          ],
        ),
      ),
    );
  }
}

class _IdeaAddonHeader extends StatelessWidget {
  const _IdeaAddonHeader({
    required this.title,
    required this.icon,
    required this.onEditTap,
    required this.onVisibilityToggle,
    this.isContentVisible,
    super.key,
  });

  final String title;
  final Widget icon;
  final VoidCallback onEditTap;
  final bool? isContentVisible;
  final VoidCallback onVisibilityToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: context.paddings.horizontalStandard,
      child: Row(
        children: [
          icon,
          context.spaces.horizontalSmall,
          Text(title, style: theme.textTheme.titleMedium),
          const Spacer(),
          IconButton(
            onPressed: onEditTap,
            icon: const Icon(Icons.edit, size: 20),
          ),
          if (isContentVisible != null)
            IconButton(
              onPressed: onVisibilityToggle,
              icon: Icon(
                isContentVisible!
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

class _IdeaAddonValues extends StatelessWidget {
  const _IdeaAddonValues({required this.values, super.key});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: values
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
