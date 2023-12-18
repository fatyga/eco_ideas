import 'package:eco_ideas/features/auth/presentation/presentation.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Column(
      children: <Widget>[
        const SignUpUserAvatar(),
        const SizedBox(height: 24),
        SignUpUsernameField(l10n: l10n),
        const SizedBox(height: 12),
        SignUpEmailField(l10n: l10n),
        const SizedBox(height: 12),
        SignUpPasswordField(l10n: l10n),
        const SizedBox(height: 12),
        SignUpPasswordRetypeField(
          l10n: l10n,
        ),
        const SizedBox(height: 12),
        const SignUpButton(),
      ],
    );
  }
}
