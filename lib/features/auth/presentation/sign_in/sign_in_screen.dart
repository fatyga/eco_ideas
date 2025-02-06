import 'package:eco_ideas/app_logo.dart';
import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/loading_widget.dart';

import 'package:eco_ideas/utils/spaces.dart';
import 'package:eco_ideas/utils/state_with_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO(fatyga): simplify layout
// TODO(fatyga): implement soft keyboard hiding when one of fields is focused

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  static const String routeName = '/signIn';

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen>
    with LoadingFeedbackMixin<SignInScreen> {
  // Indicates, that email login was selected
  bool _isEmailLoginSelected = false;

  AppLocalizations get l10n => context.l10n;

  void _setEmailLogin(bool value) {
    setState(() {
      _isEmailLoginSelected = value;
    });
  }

  Future<void> _signInWithGoogle() async {
    setLoading(true);

    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } on AuthException catch (e) {
      if (mounted) {
        handleAuthException(context, e);
      }
    } catch (e, _) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.unknown_exception)));
      }
    }
    setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingFeedback(
      isLoading: isLoading,
      child: Scaffold(
        body: Padding(
          padding: context.paddings.allLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.spaces.verticalLarge,
              const AppLogo(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isEmailLoginSelected) ...[
                    Flexible(
                      child: Padding(
                        padding: context.paddings.verticalLarge,
                        child: EmailSignInForm(
                          setLoading: setLoading,
                          onChangeSignInMethodTap: () => _setEmailLogin(false),
                        ),
                      ),
                    ),
                  ],
                  if (!_isEmailLoginSelected)
                    Padding(
                      padding: context.paddings.verticalLarge,
                      child: AuthMethods(
                        onEmailSelected: () => _setEmailLogin(true),
                        onGoogleSelected: _signInWithGoogle,
                        onFacebookSelected: () {},
                      ),
                    ),
                  const Divider(),
                  const SignInScreenFooter(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
