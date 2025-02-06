import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/utils/loading_widget.dart';
import 'package:eco_ideas/utils/spaces.dart';
import 'package:eco_ideas/utils/state_with_loading.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with LoadingFeedbackMixin {
  // Indicates, that email registration was selected
  bool _isEmailRegistrationSelected = false;

  void _setEmailRegistration(bool value) {
    setState(() {
      _isEmailRegistrationSelected = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return LoadingFeedback(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEmailRegistrationSelected
                ? l10n.signInScreenFooter_createAccount
                : l10n.choose_signUp_method,
          ),
        ),
        body: Padding(
          padding: context.paddings.allLarge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              if (_isEmailRegistrationSelected) ...[
                Flexible(
                  child: Padding(
                    padding: context.paddings.verticalLarge,
                    child: EmailSignUpForm(
                      setLoading: setLoading,
                      onChangeSignUpMethodTap: () =>
                          _setEmailRegistration(false),

                    ),
                  ),
                ),
              ],
              if (!_isEmailRegistrationSelected)
                Padding(
                  padding: context.paddings.verticalLarge,
                  child: AuthMethods(
                    onEmailSelected: () => _setEmailRegistration(true),
                    onGoogleSelected: () {},
                    onFacebookSelected: () {},
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

