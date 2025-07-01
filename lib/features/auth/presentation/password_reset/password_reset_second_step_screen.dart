import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/arb/app_localizations.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/loading_widget.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:eco_ideas/utils/state_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordResetSecondStepScreen extends ConsumerStatefulWidget {
  const PasswordResetSecondStepScreen({super.key});

  static const String routeName = 'passwordResetSecondStep';

  @override
  ConsumerState<PasswordResetSecondStepScreen> createState() =>
      _PasswordResetScreenState();
}

class _PasswordResetScreenState
    extends ConsumerState<PasswordResetSecondStepScreen>
    with LoadingFeedbackMixin {
  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = TextEditingController();

  AppLocalizations get l10n => context.l10n;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final password = _passwordFieldKey.text;

      setLoading(value: true);

      try {
        await ref.read(authRepositoryProvider).setNewPassword(password);

        setState(() {
        });
      } on AuthException catch (e) {
        if (mounted) {
          handleAuthException(context, e);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l10n.unknown_exception)));
        }
      }

      setLoading(value: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return LoadingFeedback(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.passwordResetSecondStepScreen_appBar_title),
        ),
        body: Padding(
          padding: context.paddings.allLarge,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.passwordResetSecondStep_description),
                context.spaces.verticalLarge,
                RestrictedPasswordField(
                  controller: _passwordFieldKey,
                ),
                ListenableBuilder(
                  listenable: _passwordFieldKey,
                  builder: (context, _) {
                    return PasswordField(
                      match: _passwordFieldKey.text,
                    );
                  },
                ),
                context.spaces.verticalLarge,
                FilledButton(
                  onPressed: _submit,
                  child: Text(l10n.confirm),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
