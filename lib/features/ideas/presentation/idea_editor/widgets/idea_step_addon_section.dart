import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step/eco_idea_step.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:eco_ideas/features/ideas/presentation/idea_editor/editor_fields/addon_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

class IdeaStepAddonSection extends ConsumerStatefulWidget {
  const IdeaStepAddonSection({
    required this.step,
    required this.addonType,
    required this.onChange,
    super.key,
  });

  final EcoIdeaStep step;
  final IdeaStepAddonType addonType;
  final void Function(EcoIdeaStepAddon addon) onChange;

  @override
  ConsumerState<IdeaStepAddonSection> createState() =>
      _IdeaStepAddonSectionState();
}

class _IdeaStepAddonSectionState extends ConsumerState<IdeaStepAddonSection> {
  late List<EcoIdeaStepAddon> values;

  @override
  void initState() {
    values = widget.step.addons
        .where(
          (addon) => addon.type == widget.addonType,
        )
        .toList();
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
            child: Opacity(
              opacity: values.isEmpty ? 0.8 : 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _IdeaStepAddonHeader(
                    addonType: widget.addonType,
                    onAddTap: () {
                      setState(() {
                        values.add(
                          EcoIdeaStepAddon(
                            id: values.isEmpty ? 0 : values.last.id + 1,
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
                    Flexible(
                      child: _IdeaStepAddonSubpoints(
                        values: values,
                        onReorder:
                            ref.read(ideasRepositoryProvider).reorderAddons,
                        onChange: widget.onChange,
                      ),
                    ),
                ],
              ),
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
    required this.onReorder,
    required this.onChange,
  });

  final List<EcoIdeaStepAddon> values;
  final void Function({
    required EcoIdeaStepAddon firstAddon,
    required EcoIdeaStepAddon secondAddon,
  }) onReorder;
  final void Function(EcoIdeaStepAddon addon) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ReorderableList(
        shrinkWrap: true,
        itemCount: values.length,
        onReorder: (oldIndex, newIndex) => onReorder(
          firstAddon: values[oldIndex],
          secondAddon: values[newIndex],
        ),
        itemBuilder: (context, index) => Padding(
          key: ValueKey(values[index].fieldName),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                children: [
                  ReorderableDragStartListener(
                    key: ValueKey(values[index].fieldName),
                    index: index,
                    child: const Icon(
                      Icons.reorder,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: IdeaAddonField(
                      stepAddon: values[index],
                      onChange: onChange,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 16),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
