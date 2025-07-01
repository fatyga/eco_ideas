import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/l10n/arb/app_localizations.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'idea_addon_header.dart';

part 'idea_addon_items.dart';

enum IdeaAddonType {
  hints,
  warnings,
  essentials,
  benefits;

  bool get isTips => this == IdeaAddonType.hints;

  bool get isWarnings => this == IdeaAddonType.warnings;

  bool get isEssentials => this == IdeaAddonType.essentials;

  bool get isBenefits => this == IdeaAddonType.benefits;

  String getTitle(AppLocalizations l10n) {
    return switch (this) {
      IdeaAddonType.hints => 'hints',
      IdeaAddonType.warnings => 'warnings',
      IdeaAddonType.benefits => 'benefits',
      IdeaAddonType.essentials => 'essentials'
    };
  }

  IconData getIcon() {
    return switch (this) {
      IdeaAddonType.hints => Icons.tips_and_updates_outlined,
      IdeaAddonType.warnings => Icons.warning_amber,
      IdeaAddonType.essentials => Icons.task_alt,
      IdeaAddonType.benefits => Icons.health_and_safety_sharp
    };
  }

  MaterialColor getColor() {
    return switch (this) {
      IdeaAddonType.hints => Colors.yellow,
      IdeaAddonType.warnings => Colors.red,
      IdeaAddonType.essentials => Colors.blue,
      IdeaAddonType.benefits => Colors.green,
    };
  }
}

class IdeaAddon extends StatefulWidget {
  const IdeaAddon({
    required this.addonType,
    required this.items,
    required this.onConfirm,
    super.key,
  });

  final IdeaAddonType addonType;
  final List<String> items;
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

  void _showEditorDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => IdeaAddonEditorDialog(
        title: widget.addonType.name,
        values: widget.items,
        onConfirm: widget.onConfirm,
      ),
    );
  }

  bool? get getHideShowButtonStatus =>
      widget.items.isEmpty ? null : isContentVisible;

  bool get shouldItemsBeShown => widget.items.isNotEmpty && isContentVisible;

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
            padding: context.paddings.allSmall,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                _IdeaAddonHeader(
                  addonType: widget.addonType,
                  itemsCount: widget.items.length,
                  isContentVisible: getHideShowButtonStatus,
                  onEditTap: _showEditorDialog,
                  onVisibilityToggle: _toggleVisibility,
                ),
                if (shouldItemsBeShown)
                  Padding(
                    padding: context.paddings.horizontalLarge,
                    child: _IdeaAddonItems(items: widget.items),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
