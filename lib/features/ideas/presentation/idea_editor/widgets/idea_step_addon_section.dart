import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/addon_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class IdeaStepAddonSection extends StatefulWidget {
  const IdeaStepAddonSection({
    required this.step,
    required this.addonType,
    required this.onSubmit,
    this.initialValues = const [],
    super.key,
  });

  final EcoIdeaStep step;
  final IdeaStepAddonType addonType;
  final List<EcoIdeaStepAddon> initialValues;
  final void Function(EcoIdeaStepAddon addon) onSubmit;

  @override
  State<IdeaStepAddonSection> createState() => _IdeaStepAddonSectionState();
}

class _IdeaStepAddonSectionState extends State<IdeaStepAddonSection> {
  late List<EcoIdeaStepAddon> values;

  @override
  void initState() {
    values = widget.initialValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: widget.addonType.getColor(),
          brightness: Theme.of(context).colorScheme.brightness,
        ),
      ),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: values.isEmpty
                ? null
                : BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                  ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              children: [
                _IdeaStepAddonHeader(
                  addonType: widget.addonType,
                  onAddTap: () {
                    setState(() {
                      values.add(
                        EcoIdeaStepAddon(
                          id: values.length,
                          type: widget.addonType,
                          stepId: widget.step.id,
                          ideaId: widget.step.ideaId,
                          value: '',
                        ),
                      );
                    });
                  },
                ),
                if (values.isNotEmpty)
                  _IdeaStepAddonSubpoints(
                      values: values, onSubmit: widget.onSubmit),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IdeaStepAddonHeader extends StatelessWidget {
  const _IdeaStepAddonHeader({
    required this.addonType,
    required this.onAddTap,
    super.key,
  });
  final IdeaStepAddonType addonType;
  final void Function() onAddTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            addonType.getIcon(),
            color: theme.colorScheme.surfaceTint,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            addonType.getTitle(l10n),
            style: GoogleFonts.spaceMono(
              fontSize: 13,
              textStyle: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onAddTap,
            iconSize: 20,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class _IdeaStepAddonSubpoints extends StatelessWidget {
  const _IdeaStepAddonSubpoints({
    required this.values,
    required this.onSubmit,
    super.key,
  });

  final List<EcoIdeaStepAddon> values;
  final void Function(EcoIdeaStepAddon addon) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: values
            .map(
              (addon) => IdeaAddonField(
                key: ValueKey(addon.fieldName),
                initialValue: addon.value,
                name: addon.fieldName,
                onSubmit: () => onSubmit(addon),
              ),
            )
            .toList(),
      ),
    );
  }
}
