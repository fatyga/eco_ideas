import 'package:eco_ideas/features/idea/presentation/idea_editor/components/form_fields/hint_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';

class IdeaStepHints extends StatefulWidget {
  const IdeaStepHints({
    required this.hintsControllers,
    required this.onAddHintTap,
    super.key,
  });

  final List<TextEditingController> hintsControllers;
  final VoidCallback onAddHintTap;

  @override
  State<IdeaStepHints> createState() => _IdeaStepHintsState();
}

class _IdeaStepHintsState extends State<IdeaStepHints> {
  bool areFieldsVisible = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surfaceContainerLow,
      child: Column(
        children: [
          _Header(
            areFieldsVisible:
                widget.hintsControllers.isNotEmpty ? areFieldsVisible : null,
            onAddHintTap: widget.onAddHintTap,
            onToggleFieldsVisibility: () {
              setState(() {
                areFieldsVisible = !areFieldsVisible;
              });
            },
          ),
          Visibility(
            visible: areFieldsVisible,
            child: Padding(
              padding: context.paddings.horizontalLarge,
              child: _Fields(hintsControllers: widget.hintsControllers),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onAddHintTap,
    required this.onToggleFieldsVisibility,
    this.areFieldsVisible,
    super.key,
  });

  final bool? areFieldsVisible;
  final VoidCallback onAddHintTap;
  final VoidCallback onToggleFieldsVisibility;

  @override
  Widget build(BuildContext context) {
    final l10n= context.l10n;
    final theme = Theme.of(context);
    return Padding(
      padding: context.paddings.horizontalStandard,
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline),
          context.spaces.horizontalSmall,
          Text(l10n.hints, style: theme.textTheme.titleMedium),
          const Spacer(),
          IconButton(onPressed: onAddHintTap, icon: const Icon(Icons.add)),
          if (areFieldsVisible != null)
            IconButton(
              onPressed: onToggleFieldsVisibility,
              icon: Icon(
                areFieldsVisible!
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ),
        ],
      ),
    );
  }
}

class _Fields extends StatelessWidget {
  const _Fields({required this.hintsControllers, super.key});

  final List<TextEditingController> hintsControllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: hintsControllers
          .map(
            (hintController) => HintField(controller: hintController),
          )
          .toList(),
    );
  }
}
