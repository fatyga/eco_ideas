import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/sign_in_form/forgot_password_action_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
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
    return Form(
      child: Column(
        children: <Widget>[
          EmailField(
            focusNode: emailFocusNode,
          ),
          const SizedBox(height: 12),
          PasswordField(focusNode: passwordFocusNode),
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
      ),
    );
  }
}
