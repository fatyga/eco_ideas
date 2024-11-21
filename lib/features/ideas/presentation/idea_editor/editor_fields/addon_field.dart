import 'package:eco_ideas/features/ideas/data/ideas_repository.dart';
import 'package:eco_ideas/features/ideas/domain/eco_idea_step_addon/eco_idea_step_addon.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class IdeaAddonField extends ConsumerStatefulWidget {
  const IdeaAddonField(
      {required this.onChange, required this.stepAddon, super.key});

  final EcoIdeaStepAddon stepAddon;
  final void Function(EcoIdeaStepAddon updatedStepAddon) onChange;
  @override
  ConsumerState<IdeaAddonField> createState() => _IdeaAddonFieldState();
}

class _IdeaAddonFieldState extends ConsumerState<IdeaAddonField> {
  final _fieldKey = GlobalKey<FormBuilderFieldState>();
  late AsyncValue<String> submission = const AsyncData('');

  Future<void> submit() async {
    final field = _fieldKey.currentState?..validate();

    if (field != null &&
        field.isValid &&
        field.value != widget.stepAddon.value) {
      setState(() {
        submission = const AsyncLoading<String>().copyWithPrevious(submission);
      });

      submission = await AsyncValue.guard(() async {
        final updatedStepAddon =
            await ref.read(ideasRepositoryProvider).updateIdeaStepAddon(
                  ideaStepAddon:
                      widget.stepAddon.copyWith(value: field.value as String),
                );
        field.save();
        widget.onChange(updatedStepAddon);
        return updatedStepAddon.value;
      });

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Focus(
      onFocusChange: (value) {
        if (!value) submit();
      },
      child: FormBuilderTextField(
        key: _fieldKey,
        name: widget.stepAddon.fieldName,
        initialValue: widget.stepAddon.value,
        onEditingComplete: submit,
        maxLines: null,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
          isCollapsed: true,
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: l10n.requiredValidatorErrorText,
          ),
        ]),
      ),
    );
  }
}
