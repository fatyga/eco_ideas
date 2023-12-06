import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_button.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_email_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_password_field.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/widgets/sign_up_form/sign_up_password_retype_field.dart';
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
