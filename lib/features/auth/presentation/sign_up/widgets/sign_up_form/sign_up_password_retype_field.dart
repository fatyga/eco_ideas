import 'package:eco_ideas/common/widgets/password_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPasswordRetypeField extends ConsumerWidget {
  const SignUpPasswordRetypeField({
    required this.l10n,
    this.focusNode,
    super.key,
  });

  final FocusNode? focusNode;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      errorText: inputState == null ||
              !shouldBeEnabled // if passwordInput is invalid, we don't want to show errorText
          ? null
          : inputState.isPure
              ? null
              : inputState.isNotValid
                  ? inputState.error!.errorText(l10n)
                  : null,
    );
  }
}
