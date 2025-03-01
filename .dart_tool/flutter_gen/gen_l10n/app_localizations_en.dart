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
  String get unknown_exception => 'Unexpected error occurred';

  @override
  String get requiredField => 'Required field';

  @override
  String get confirm => 'Confirm';

  @override
  String get emailAddress => 'Email address';

  @override
  String get incorrectFormat => 'Incorrect format';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get tooShortPassword => 'At least 8 characters are required.';

  @override
  String get digitIsRequired => 'At least one digit is required';

  @override
  String get passwordMismatch => 'Passwords are mismatched';

  @override
  String get invalid_credentials => 'Invalid login credentials';

  @override
  String get emailSignInForm_submit => 'Sign in';

  @override
  String get change_signIn_method => 'Change login method';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithFacebook => 'Continue with Facebook';

  @override
  String get continueWithEmail => 'Continue with Email address';

  @override
  String get signInScreenFooter_forgotPassword => 'Forgot password?';

  @override
  String get signInScreenFooter_createAccount => 'Create account';

  @override
  String get resetYourPassword => 'Reset your password';

  @override
  String get passwordResetFirstStepScreen_appBar_title => 'Reset your password';

  @override
  String get passwordResetSecondStepScreen_appBar_title => 'Provide new password';

  @override
  String get passwordResetFirstStep_description => 'Please enter an email address with which your account was created.';

  @override
  String get passwordResetSecondStep_description => 'In order to finish password reset procedure, please provide new password.';

  @override
  String get passwordResetLinkSent_title => 'Link was sent!';

  @override
  String get passwordResetLinkSent_description => 'We\'ve sent a link to given email address. Please open it to finish the process of resetting password.';

  @override
  String get passwordResetExitDialogTitleText => 'Are you want to cancel?';

  @override
  String get passwordResetExitDescriptionText => 'Password reset procedure will fail.';

  @override
  String get username => 'Username';

  @override
  String get signUp => 'Sign up';

  @override
  String get choose_signUp_method => 'Choose sign up method';

  @override
  String get change_signUp_method => 'Change sign up method';

  @override
  String get emailConfirmationLinkSent => 'Email confirmation link sent';

  @override
  String get emailConfirmation => 'We\'ve sent you email with confirmation link';

  @override
  String get explore => 'Explore';

  @override
  String get myIdeas => 'My ideas';

  @override
  String get myProfile => 'My profile';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get editYourProfile => 'Edit your profile';

  @override
  String get fullName => 'Full name';

  @override
  String get bio => 'Bio';
}
