import 'package:eco_ideas/common/widgets/password_field.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPasswordField extends ConsumerWidget {
  const SignInPasswordField({
    required this.focusNode,
    required this.l10n,
    super.key,
  });

  final FocusNode focusNode;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputState = ref.watch(
      signInControllerProvider.select(
        (controllerState) => controllerState.valueOrNull?.passwordInput,
      ),
    );
    final isLoading = ref.watch(
      signInControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );
    return PasswordField(
      enabled: !isLoading,
      focusNode: focusNode,
      onChanged:
          ref.read(signInControllerProvider.notifier).updatePasswordField,
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
