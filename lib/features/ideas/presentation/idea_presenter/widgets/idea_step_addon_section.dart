import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class IdeaPresenterAddonSection extends StatefulWidget {
  const IdeaPresenterAddonSection({
    required this.addon,
    required this.values,
    super.key,
  });

  final IdeaStepAddonType addon;
  final List<EcoIdeaStepAddon> values;

  @override
  State<IdeaPresenterAddonSection> createState() =>
      _IdeaPresenterAddonSectionState();
}

class _IdeaPresenterAddonSectionState extends State<IdeaPresenterAddonSection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: widget.addon.getColor(),
          brightness: Theme.of(context).colorScheme.brightness,
        ),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return Container(
            decoration: widget.values.isEmpty || !isExpanded
                ? null
                : BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                  ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Icon(
                        widget.addon.getIcon(),
                        color: theme.colorScheme.surfaceTint,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.addon.getTitle(l10n),
                        style: GoogleFonts.spaceMono(
                          fontSize: 13,
                          textStyle: theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        iconSize: 20,
                        icon: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.values.isNotEmpty && isExpanded)
                  _IdeaPresenterAddonSubpoints(
                    values: widget.values.map((addon) => addon.value).toList(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IdeaPresenterAddonSubpoints extends StatelessWidget {
  const _IdeaPresenterAddonSubpoints({required this.values});

  final List<String> values;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: values
          .map(
            (value) => Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 6),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      value,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
