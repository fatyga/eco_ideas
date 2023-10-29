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
  String get signInButtonText => 'Sign In';

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get badEmailOrPasswordFailureSnackBarText => 'Incorrect email address or password.';
}
