import 'package:eco_ideas/features/auth/presentation/sign_in/widgets/widgets.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/go_router_provider/go_router_provider.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    required this.emailFocusNode,
    required this.passwordFocusNode,
    super.key,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: <Widget>[
        SignInEmailField(focusNode: emailFocusNode, l10n: l10n),
        const SizedBox(height: 12),
        SignInPasswordField(focusNode: passwordFocusNode, l10n: l10n),
        Container(
          padding: const EdgeInsets.only(top: 4),
          alignment: Alignment.centerRight,
          child: ForgotPasswordActionButton(),
        ),
        const SizedBox(height: 12),
        const SignInButton(),
      ],
    );
  }
}
