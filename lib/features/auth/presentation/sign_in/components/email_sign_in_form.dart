import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailSignInForm extends ConsumerStatefulWidget {
  const EmailSignInForm({super.key});

  @override
  ConsumerState<EmailSignInForm> createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends ConsumerState<EmailSignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  // Represents an ongoing submission
  bool _isLoading = false;

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final email = _emailFieldController.text;
      final password = _passwordFieldController.text;

      setState(() {
        _isLoading = true;
      });

      try {
        await ref
            .read(authRepositoryProvider)
            .signInWithEmailAndPassword(email: email, password: password);
      } on AuthException catch (e) {
        _handleAuthException(e);
      } catch (e) {
        _handleUnknownException(e);
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  // Shows [SnackBar] with internationalized descriptive message
  void _handleAuthException(AuthException exception) {
    final String message;
    if (exception.code == 'invalid_credentials') {
      message = context.l10n.emailSignInForm_invalid_credentials;
    } else {
      message = context.l10n.emailSignInForm_unknown;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _handleUnknownException(Object exception) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.emailSignInForm_unknown)),
    );
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
        children: <Widget>[
          EmailField(controller: _emailFieldController),
          PasswordField(controller: _passwordFieldController),
          context.spaces.verticalLarge,
          FilledButton(
            onPressed: _submit,
            child: Text(l10n.emailSignInForm_submit),
          ),
        ],
      ),
    );
  }
}
