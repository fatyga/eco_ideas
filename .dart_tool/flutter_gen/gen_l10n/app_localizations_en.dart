// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'EcoIdeas';

  @override
  String get field_required => 'Required field';

  @override
  String get emailField_label => 'Email address';

  @override
  String get emailField_validator_invalid => 'Incorrect format';

  @override
  String get passwordField_label => 'Password';

  @override
  String get emailSignInForm_submit => 'Sign in';

  @override
  String get emailSignInForm_unknown => 'Unexpected error during login';

  @override
  String get emailSignInForm_invalid_credentials => 'Invalid login credentials';

  @override
  String get signInMethods_hint => 'Continue with';

  @override
  String get signInScreenFooter_forgotPassword => 'Forgot password?';

  @override
  String get signInScreenFooter_createAccount => 'Create account';
}
