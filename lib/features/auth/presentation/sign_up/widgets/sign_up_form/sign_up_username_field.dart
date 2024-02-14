import 'package:eco_ideas/common/widgets/auth_forms_fields/username_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpUsernameField extends ConsumerWidget {
  const SignUpUsernameField({
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      signUpControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.usernameInput,
      ),
    );
    final isLoading = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    return UsernameField(
      enabled: !isLoading,
      focusNode: focusNode,
      onChanged:
          ref.read(signUpControllerProvider.notifier).updateUsernameField,
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
