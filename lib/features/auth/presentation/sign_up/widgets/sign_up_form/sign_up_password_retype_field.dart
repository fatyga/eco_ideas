import 'package:eco_ideas/common/widgets/ei_form/ei_form_fields/password_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPasswordRetypeField extends ConsumerWidget {
  const SignUpPasswordRetypeField({
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final inputState = ref.watch(
      signUpControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordRetypeInput,
      ),
    );
    final isLoading = ref.watch(
      signUpControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );

    final passwordInputState = ref.watch(
      signUpControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordInput,
      ),
    );

    final bool shouldBeEnabled;
    if (passwordInputState == null) {
      shouldBeEnabled = false;
    } else {
      shouldBeEnabled = !isLoading &&
          (!passwordInputState.isPure && passwordInputState.isValid);
    }

    return PasswordField(
      forRetype: true,
      enabled: shouldBeEnabled,
      focusNode: focusNode,
      onChanged:
          ref.read(signUpControllerProvider.notifier).updatePasswordRetypeField,

      /// if passwordInput is invalid, we don't want to show errorText
      errorText: inputState == null || !shouldBeEnabled
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
