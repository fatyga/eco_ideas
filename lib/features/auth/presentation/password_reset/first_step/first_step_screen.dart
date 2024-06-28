import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/controller/controller.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/widgets/form.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/widgets/link_sent.dart';
import 'package:eco_ideas/l10n/l10n.dart';

import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordResetFirstStepScreen extends ConsumerStatefulWidget {
  const PasswordResetFirstStepScreen({super.key});

  static const String path = 'firstStep';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordResetFirstStepScreenState();
}

class _PasswordResetFirstStepScreenState
    extends ConsumerState<PasswordResetFirstStepScreen> {
  bool isLinkSent = false;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => context.go(const AuthRoute().location),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.passwordResetFirstStepAppBarTitleText)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: isLinkSent
                  ? const LinkSentWidget()
                  : PasswordResetEmailForm(
                      onSubmit: () => setState(() {
                        isLinkSent = true;
                      }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
