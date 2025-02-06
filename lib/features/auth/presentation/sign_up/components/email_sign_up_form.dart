import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailSignUpForm extends ConsumerStatefulWidget {
  const EmailSignUpForm({
    required this.setLoading,
    required this.onChangeSignUpMethodTap,

    super.key,
  });

  final ValueChanged<bool> setLoading;
  final VoidCallback onChangeSignUpMethodTap;



  @override
  ConsumerState<EmailSignUpForm> createState() => _EmailSignUpFormState();
}

class _EmailSignUpFormState extends ConsumerState<EmailSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _usernameFieldController = TextEditingController();

  AppLocalizations get l10n => context.l10n;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final email = _emailFieldController.text;
      final password = _passwordFieldController.text;
      final username = _usernameFieldController.text;

      widget.setLoading(true);

      try {
        await ref.read(authRepositoryProvider).signUpWithEmailAndPassword(
              username: username,
              email: email,
              password: password,
            );

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

      widget.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailField(controller: _emailFieldController),
          UsernameField(controller: _usernameFieldController),
          Flexible( child: RestrictedPasswordField(controller: _passwordFieldController)),
          ListenableBuilder(
            listenable: _passwordFieldController,
            builder: (context, _) {
              return PasswordField(match: _passwordFieldController.text);
            },
          ),
          context.spaces.verticalLarge,
          FilledButton(
            onPressed: _submit,
            child: Text(l10n.signUp),
          ),
          OutlinedButton.icon(
            onPressed: widget.onChangeSignUpMethodTap,
            icon: const Icon(Icons.arrow_back),
            label: Text(l10n.change_signUp_method),
          ),
        ],
      ),
    );
  }
}
