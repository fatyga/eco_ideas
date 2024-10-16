import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum IdeaStepAddonType {
  tip,
  warning,
  requirment,
  benefit;

  String getTitle(AppLocalizations l10n) {
    return switch (this) {
      IdeaStepAddonType.tip => l10n.ideaStepTipAddonTitle,
      IdeaStepAddonType.warning => l10n.ideaStepWarningAddonTitle,
      IdeaStepAddonType.benefit => l10n.ideaStepBenefitAddonTitle,
      IdeaStepAddonType.requirment => l10n.ideaStepRequirmentAddonTitle,
    };
  }

  IconData getIcon() {
    return switch (this) {
      IdeaStepAddonType.tip => Icons.tips_and_updates,
      IdeaStepAddonType.warning => Icons.warning_amber,
      IdeaStepAddonType.requirment => Icons.task_alt,
      IdeaStepAddonType.benefit => Icons.health_and_safety_sharp
    };
  }

  Color getColor() {
    return switch (this) {
      IdeaStepAddonType.tip => Colors.green[200]!,
      IdeaStepAddonType.warning => Colors.red[200]!,
      IdeaStepAddonType.requirment => Colors.yellow[200]!,
      IdeaStepAddonType.benefit => Colors.blue[200]!,
    };
  }
}

class IdeaStepAddon extends StatefulWidget {
  const IdeaStepAddon({required this.addonType, super.key});

  final IdeaStepAddonType addonType;

  @override
  State<IdeaStepAddon> createState() => _IdeaStepAddonState();
}

class _IdeaStepAddonState extends State<IdeaStepAddon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_IdeaStepAddonHeader(addonType: widget.addonType)],
    );
  }
}

class _IdeaStepAddonHeader extends StatelessWidget {
  const _IdeaStepAddonHeader({required this.addonType, super.key});
  final IdeaStepAddonType addonType;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(addonType.getIcon(), color: addonType.getColor()),
          const SizedBox(width: 12),
          Text(
            addonType.getTitle(l10n),
            style: theme.textTheme.titleMedium!.copyWith(
              color: addonType.getColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
