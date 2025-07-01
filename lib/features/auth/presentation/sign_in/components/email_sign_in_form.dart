import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/arb/app_localizations.dart';

import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO(fatyga): find better name for onChangeSignInMethodTap
class EmailSignInForm extends ConsumerStatefulWidget {
  const EmailSignInForm({
    required this.setLoading,
    required this.onChangeSignInMethodTap,
    super.key,
  });

  final void Function({required bool value}) setLoading;
  final VoidCallback onChangeSignInMethodTap;

  @override
  ConsumerState<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends ConsumerState<EmailSignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  AppLocalizations get l10n => context.l10n;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final email = _emailFieldController.text;
      final password = _passwordFieldController.text;

      widget.setLoading(value: true);

      try {
        await ref
            .read(authRepositoryProvider)
            .signInWithEmailAndPassword(email: email, password: password);
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

      widget.setLoading(value: false);
    }
  }

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          EmailField(controller: _emailFieldController),
          PasswordField(
            controller: _passwordFieldController,
          ),
          context.spaces.verticalLarge,
          FilledButton(
            onPressed: _submit,
            child: Text(l10n.emailSignInForm_submit),
          ),
          OutlinedButton.icon(
            onPressed: widget.onChangeSignInMethodTap,
            icon: const Icon(Icons.arrow_back),
            label: Text(l10n.change_signIn_method),
          ),
        ],
      ),
    );
  }
}
