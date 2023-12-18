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
  String get passwordRetypeFieldLabelText => 'Retype password';

  @override
  String get usernameTextFieldLabelText => 'Username';

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
  String get signUpPasswordInputErrorSpecialCharacterNotPresentText => 'At least one special character(!@#\$%^&*) is required';

  @override
  String get signUpPasswordInputErrorDigitNotPresent => 'At least one digit(0-9) is required';

  @override
  String get signUpPasswordInputErrorUppercaseNotPresent => 'At least one uppercase letter(A-Z) is required';

  @override
  String get emailInputEmptyErrorText => 'Email can\'t be empty';

  @override
  String get emailInputInvalidErrorText => 'Email is invalid';

  @override
  String get signUpScreenAppBarTitle => 'Create an account';

  @override
  String get signUpButtonText => 'Register';

  @override
  String get signUpPasswordRetypeInputMismatchErrorText => 'Passwords are mismatched';

  @override
  String get signUpPasswordretypeInputemptyErrorText => 'This field can\'t be empty';

  @override
  String get signUpUsernameInputErrorEmptyText => 'Username can\'t be empty';

  @override
  String get signUpUsernameInputErrorTooShortText => 'Username is too short(at least 6 characters)';

  @override
  String get signUpChangeAvatarButtonLabelText => 'Change avatar';

  @override
  String get signUpAddAvatarButtonLabelText => 'Add avatar';

  @override
  String get signUpDeleteAvatarButtonLabelText => 'Delete avatar';

  @override
  String get signUpPickAvatarDialogTitle => 'Add avatar from:';

  @override
  String get signUpPickAvatarDialogGalleryOptionTitle => 'gallery';

  @override
  String get signUpPickAvatarDialogCameraOptionTitle => 'camera';

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get badEmailOrPasswordFailureSnackBarText => 'Incorrect email address or password.';
}
