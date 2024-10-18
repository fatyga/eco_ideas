import 'package:eco_ideas/features/ideas/presentation/idea_editor/form_fields/addon_field.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  MaterialColor getColor() {
    return switch (this) {
      IdeaStepAddonType.tip => Colors.green,
      IdeaStepAddonType.warning => Colors.red,
      IdeaStepAddonType.requirment => Colors.grey,
      IdeaStepAddonType.benefit => Colors.blue,
    };
  }
}

class IdeaStepAddon extends StatefulWidget {
  const IdeaStepAddon({
    required this.addonType,
    this.initialValues = const [],
    super.key,
  });

  final IdeaStepAddonType addonType;
  final List<String> initialValues;

  @override
  State<IdeaStepAddon> createState() => _IdeaStepAddonState();
}

class _IdeaStepAddonState extends State<IdeaStepAddon> {
  late List<String> values;

  @override
  void initState() {
    values = widget.initialValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: values.isEmpty
          ? null
          : BoxDecoration(
              color: widget.addonType.getColor().shade50,
              borderRadius: BorderRadius.circular(6),
            ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        children: [
          _IdeaStepAddonHeader(addonType: widget.addonType),
          if (values.isNotEmpty) _IdeaStepAddonForm(values: values),
        ],
      ),
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
          Icon(
            addonType.getIcon(),
            color: addonType.getColor().shade400,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            addonType.getTitle(l10n),
            style: GoogleFonts.spaceMono(
              textStyle: theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

class _IdeaStepAddonForm extends StatelessWidget {
  const _IdeaStepAddonForm({required this.values, super.key});

  final List<String> values;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        children: values
            .map(
              (value) => IdeaAddonField(
                onSubmit: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
