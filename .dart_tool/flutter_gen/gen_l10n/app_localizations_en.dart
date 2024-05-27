import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'EcoIdeas';

  @override
  String get greetingText => 'Welcome in ';

  @override
  String get requiredValidatorErrorText => 'This field is obligatory';

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
  String get aboutMeTextFieldLabelText => 'About me';

  @override
  String get googleAuthButtonLabelText => 'Continue with Google';

  @override
  String get signInButtonText => 'Sign In';

  @override
  String get signInLabeledDividerText => 'OR';

  @override
  String get passwordResetFirstStepAppBarTitleText => 'Reset your password';

  @override
  String get passwordResetSecondStepAppBarTitleText => 'Provide new password';

  @override
  String get passwordResetFirstStepDescription => 'Please enter an email address with which your account was created.';

  @override
  String get passwordResetSecondStepDescription => 'In order to finish password reset procedure, please provide new password';

  @override
  String get passwordResetLinkSentTitle => 'Link was sent!';

  @override
  String get passwordResetLinkSentDescription => 'We\'ve sent a link to given email address. Please open it to finish the proccess of resetting password.';

  @override
  String get passwordResetConfirmButtonText => 'Confirm';

  @override
  String get passwordResetExitDialogTitleText => 'Are you want to cancel?';

  @override
  String get passwordResetExitDescriptionText => 'Password reset procedure will fail.';

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
  String get signUpConfirmEmailAppBarTitleText => 'Confirm your email';

  @override
  String get signUpConfirmEmailTitle => 'Activation link was sent';

  @override
  String get signUpConfirmEmailDescription => 'We\'ve sent you an activation link to your mailbox. Please open it to finish the process of signing up';

  @override
  String get signUpCompletionFormTitle => 'Express yourself!';

  @override
  String get signUpCompletionFormDescription => 'Before you start using EcoIdeas, you can let other users get to know you better!';

  @override
  String get signUpCompletionFormSubmitButton => 'Done!';

  @override
  String get signUpCompletionDoneTitle => 'Congratulations!';

  @override
  String get signUpCompletionDoneDescription => 'Your account was created successfully. You can start use the app';

  @override
  String get signUpCompletionDoneButtonText => 'Let\'s start!';

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get avatarDialogSaveButtonText => 'Confirm';

  @override
  String get avatarDialogChangeAvatarButtonLabelText => 'Change avatar';

  @override
  String get avatarDialogAddAvatarButtonLabelText => 'Add avatar';

  @override
  String get avatarDialogDeleteAvatarButtonLabelText => 'Delete avatar';

  @override
  String get avatarDialogCloseButtonTooltipText => 'Close dialog';

  @override
  String get avatarDialogPickGalleryOptionLabelText => 'gallery';

  @override
  String get avatarDialogCameraOptionLabelText => 'camera';

  @override
  String get signUpFailSnackBarText => 'Account could not be created.';

  @override
  String get updateUserFail => 'Unsuccessful attempt to update user account.';

  @override
  String get setNewPasswordFail => 'Unsuccessful attempt to set new password';

  @override
  String get invalidDeepLinkSnackBarText => 'Link has expired or is invalid.';

  @override
  String get signInFailSnackBarText => 'Unsuccessful sign-in attempt.';

  @override
  String get passwordResetLinkSentFailSnackBarText => 'Unsuccessful attempt to send a link.';

  @override
  String get setUpNewPasswordFailSnackBarText => 'Unsuccessful attempt to set up new password.';

  @override
  String get signOutFailSnackBarText => 'Unsuccessful attempt to sign out.';

  @override
  String get getUserProfileFailSnackBarText => 'Unsuccessful attempt to get user profile';

  @override
  String get uploadAvatarFailSnackBarText => 'Unsuccessful attempt to upload avatar';

  @override
  String get updateUserProfileFailSnackBarText => 'Unsuccessful attempt to update profile';

  @override
  String get homeExploreLabel => 'Explore';

  @override
  String get homeMyIdeasLabel => 'My ideas';

  @override
  String get homeProfileLabel => 'My Profile';

  @override
  String get modifyMyProfileAppBarTitle => 'Edit your profile';
}
