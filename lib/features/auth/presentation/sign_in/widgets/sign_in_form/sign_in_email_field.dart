import 'package:eco_ideas/common/widgets/email_field.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInEmailField extends ConsumerWidget {
  const SignInEmailField({
    required this.focusNode,
    required this.l10n,
    super.key,
  });

  final FocusNode focusNode;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputState = ref.watch(
      signInControllerProvider
          .select((controllerState) => controllerState.valueOrNull?.email),
    );

    final isLoading = ref.watch(
      signInControllerProvider
          .select((controllerState) => controllerState.isLoading),
    );

    return EmailField(
      enabled: !isLoading,
      onChanged: ref.read(signInControllerProvider.notifier).updateEmailField,
      focusNode: focusNode,
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
