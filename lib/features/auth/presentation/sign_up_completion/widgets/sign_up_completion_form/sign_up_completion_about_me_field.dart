import 'package:eco_ideas/common/widgets/ei_form/ei_form_fields/about_me_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up_completion/sign_up_completion_controller/sign_up_completion_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpCompletionAboutMeField extends ConsumerWidget {
  const SignUpCompletionAboutMeField({
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      signUpCompletionControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.aboutMeInput,
      ),
    );
    final isLoading = ref.watch(
      signUpCompletionControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    return AboutMeField(
      enabled: !isLoading,
      focusNode: focusNode,
      onChanged: ref
          .read(signUpCompletionControllerProvider.notifier)
          .updateAboutMeInput,
      errorText: inputState == null
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
