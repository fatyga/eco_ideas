import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/controller/controller.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/widgets/form/form.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/first_step/widgets/link_sent.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/router/go_router_provider/go_router_provider.dart';
import 'package:eco_ideas/router/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PasswordResetFirstStepScreen extends ConsumerWidget {
  const PasswordResetFirstStepScreen({super.key});

  static const String path = 'firstStep';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final isLinkSent = ref.watch(
      passwordResetFirstStepControllerProvider
          .select((state) => state.valueOrNull?.isLinkSent),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => context.go(const AuthRoute().location),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.passwordResetFirstStepAppBarTitleText)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: isLinkSent != null && isLinkSent
                  ? const LinkSentWidget()
                  : const PasswordResetEmailForm(),
            ),
          ],
        ),
      ),
    );
  }
}
