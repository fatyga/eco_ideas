import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/go_router_provider/go_router_provider.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    required this.emailFocusNode,
    required this.passwordFocusNode,
    super.key,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Column(
      children: <Widget>[
        Consumer(
          builder: (context, ref, _) {
            final inputState = ref.watch(
              signInControllerProvider
                  .select((controllerState) => controllerState.value!.email),
            );

            final isLoading = ref.watch(
              signInControllerProvider.select((value) => value.isLoading),
            );

            return EmailField(
              enabled: !isLoading,
              onChanged:
                  ref.read(signInControllerProvider.notifier).updateEmailField,
              focusNode: emailFocusNode,
              errorText: inputState.isPure
                  ? null
                  : inputState.isNotValid
                      ? inputState.error!.errorText(l10n)
                      : null,
            );
          },
        ),
        const SizedBox(height: 12),
        Consumer(
          builder: (context, ref, _) {
            final inputState = ref.watch(
              signInControllerProvider
                  .select((controllerState) => controllerState.value!.password),
            );
            final isLoading = ref.watch(
              signInControllerProvider.select((value) => value.isLoading),
            );
            return PasswordField(
              enabled: !isLoading,
              focusNode: passwordFocusNode,
              onChanged: ref
                  .read(signInControllerProvider.notifier)
                  .updatePasswordField,
              errorText: inputState.isPure
                  ? null
                  : inputState.isNotValid
                      ? inputState.error!.errorText(l10n)
                      : null,
            );
          },
        ),
        Container(
          padding: const EdgeInsets.only(top: 4),
          alignment: Alignment.centerRight,
          child: ForgotPasswordActionButton(
            onPressed: () {
              ref
                  .read(goRouterProvider)
                  .go(const PasswordResetRoute().location);
            },
          ),
        ),
        const SizedBox(height: 12),
        const SignInButton(),
      ],
    );
  }
}
