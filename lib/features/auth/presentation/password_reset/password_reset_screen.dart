import 'package:eco_ideas/features/auth/presentation/password_reset/password_reset_controller/password_reset_controller.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/widgets/link_sent.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/widgets/password_reset_form/password_reset_email_form.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordResetScreen extends ConsumerWidget {
  const PasswordResetScreen({super.key});

  static const String path = 'passwordReset';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final isLinkSent = ref.watch(
      passwordResetControllerProvider
          .select((state) => state.valueOrNull?.isLinkSent),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.passwordResetAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLinkSent != null && isLinkSent
            ? const LinkSentWidget()
            : const PasswordResetEmailForm(),
      ),
    );
  }
}
