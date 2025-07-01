import 'package:eco_ideas/features/idea/idea.dart';
import 'package:eco_ideas/l10n/arb/app_localizations.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdeaEditorNavigator extends ConsumerWidget {
  const IdeaEditorNavigator({
    required this.editorState,
    super.key,
  });

  final IdeaEditorState editorState;

  String getLabel(AppLocalizations l10n) {
    if (editorState.isIntroduction) {
      return l10n.introduction;
    } else if (editorState.isStep) {
      return '${l10n.step} ${editorState.currentIndex + 1}/${editorState.idea.steps.length}';
    } else {
      return l10n.summary;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 44,
      child: BottomSheet(
        builder: (context) => Padding(
          padding: context.paddings.horizontalStandard,
          child: Row(
            children: [
              Visibility(
                visible: editorState.canStepBack,
                child: IconButton(
                  onPressed: ref
                      .read(
                        ideaEditorControllerProvider.notifier,
                      )
                      .stepBack,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(getLabel(context.l10n),
                      style: theme.textTheme.labelLarge,),
                ),
              ),
              Visibility(
                visible: editorState.canStepForward,
                child: IconButton(
                  onPressed: ref
                      .read(
                        ideaEditorControllerProvider.notifier,
                      )
                      .stepForward,
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              Visibility(
                visible: editorState.canAddStep,
                child: IconButton(
                  onPressed: ref
                      .read(
                        ideaEditorControllerProvider.notifier,
                      )
                      .addStep,
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        onClosing: () {},
      ),
    );
  }
}
