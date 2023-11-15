import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'EcoIdeas';

  @override
  String get greetingText => 'Welcome in ';

  @override
  String get emailTextFieldLabelText => 'Email';

  @override
  String get passwordTextFieldLabelText => 'Password';

  @override
  String get registerTextButtonLabelText => 'Don\'t have an account? ';

  @override
  String get registerTextButtonActionText => 'Register!';

  @override
  String get forgotPasswordButtonLabelText => 'Forget password? ';

  @override
  String get forgotPasswordButtonActionText => 'Change it!';

  @override
  String get googleAuthButtonLabelText => 'Continue with Google';

  @override
  String get signInButtonText => 'Sign In';

  @override
  String get signInLabeledDividerText => 'OR';

  @override
  String get passwordRecoveryAppBarTitle => 'Reset your password';

  @override
  String get passwordRecoveryFirstStepDescription => 'In this step, please enter email address with which your account was created.';

  @override
  String get passwordInputEmptyErrorText => 'Password can\'t be empty';

  @override
  String get passwordInputTooShortErrorText => 'Password is too short(at least 6 characters)';

  @override
  String get emailInputEmptyErrorText => 'Email can\'t be empty';

  @override
  String get emailInputInvalidErrorText => 'Email is invalid';

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get badEmailOrPasswordFailureSnackBarText => 'Incorrect email address or password.';
}
