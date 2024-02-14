import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'EcoIdeas'**
  String get appName;

  /// No description provided for @greetingText.
  ///
  /// In en, this message translates to:
  /// **'Welcome in '**
  String get greetingText;

  /// No description provided for @emailTextFieldLabelText.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailTextFieldLabelText;

  /// No description provided for @passwordTextFieldLabelText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordTextFieldLabelText;

  /// No description provided for @passwordRetypeFieldLabelText.
  ///
  /// In en, this message translates to:
  /// **'Retype password'**
  String get passwordRetypeFieldLabelText;

  /// No description provided for @usernameTextFieldLabelText.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameTextFieldLabelText;

  /// No description provided for @registerTextButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get registerTextButtonLabelText;

  /// No description provided for @registerTextButtonActionText.
  ///
  /// In en, this message translates to:
  /// **'Register!'**
  String get registerTextButtonActionText;

  /// No description provided for @forgotPasswordButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Forget password? '**
  String get forgotPasswordButtonLabelText;

  /// No description provided for @forgotPasswordButtonActionText.
  ///
  /// In en, this message translates to:
  /// **'Change it!'**
  String get forgotPasswordButtonActionText;

  /// No description provided for @aboutMeTextFieldLabelText.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutMeTextFieldLabelText;

  /// No description provided for @googleAuthButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get googleAuthButtonLabelText;

  /// No description provided for @signInButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButtonText;

  /// No description provided for @signInLabeledDividerText.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get signInLabeledDividerText;

  /// No description provided for @passwordResetFirstStepAppBarTitleText.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get passwordResetFirstStepAppBarTitleText;

  /// No description provided for @passwordResetSecondStepAppBarTitleText.
  ///
  /// In en, this message translates to:
  /// **'Provide new password'**
  String get passwordResetSecondStepAppBarTitleText;

  /// No description provided for @passwordResetFirstStepDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email address with which your account was created.'**
  String get passwordResetFirstStepDescription;

  /// No description provided for @passwordResetSecondStepDescription.
  ///
  /// In en, this message translates to:
  /// **'In order to finish password reset procedure, please provide new password'**
  String get passwordResetSecondStepDescription;

  /// No description provided for @passwordResetLinkSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Link was sent!'**
  String get passwordResetLinkSentTitle;

  /// No description provided for @passwordResetLinkSentDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a link to given email address. Please open it to finish the proccess of resetting password.'**
  String get passwordResetLinkSentDescription;

  /// No description provided for @passwordResetConfirmButtonText.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get passwordResetConfirmButtonText;

  /// No description provided for @passwordResetExitDialogTitleText.
  ///
  /// In en, this message translates to:
  /// **'Are you want to cancel?'**
  String get passwordResetExitDialogTitleText;

  /// No description provided for @passwordResetExitDescriptionText.
  ///
  /// In en, this message translates to:
  /// **'Password reset procedure will fail.'**
  String get passwordResetExitDescriptionText;

  /// No description provided for @passwordInputEmptyErrorText.
  ///
  /// In en, this message translates to:
  /// **'Password can\'t be empty'**
  String get passwordInputEmptyErrorText;

  /// No description provided for @passwordInputTooShortErrorText.
  ///
  /// In en, this message translates to:
  /// **'Password is too short(at least 6 characters)'**
  String get passwordInputTooShortErrorText;

  /// No description provided for @signUpPasswordInputErrorSpecialCharacterNotPresentText.
  ///
  /// In en, this message translates to:
  /// **'At least one special character(!@#\$%^&*) is required'**
  String get signUpPasswordInputErrorSpecialCharacterNotPresentText;

  /// No description provided for @signUpPasswordInputErrorDigitNotPresent.
  ///
  /// In en, this message translates to:
  /// **'At least one digit(0-9) is required'**
  String get signUpPasswordInputErrorDigitNotPresent;

  /// No description provided for @signUpPasswordInputErrorUppercaseNotPresent.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter(A-Z) is required'**
  String get signUpPasswordInputErrorUppercaseNotPresent;

  /// No description provided for @emailInputEmptyErrorText.
  ///
  /// In en, this message translates to:
  /// **'Email can\'t be empty'**
  String get emailInputEmptyErrorText;

  /// No description provided for @emailInputInvalidErrorText.
  ///
  /// In en, this message translates to:
  /// **'Email is invalid'**
  String get emailInputInvalidErrorText;

  /// No description provided for @signUpScreenAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get signUpScreenAppBarTitle;

  /// No description provided for @signUpButtonText.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get signUpButtonText;

  /// No description provided for @signUpPasswordRetypeInputMismatchErrorText.
  ///
  /// In en, this message translates to:
  /// **'Passwords are mismatched'**
  String get signUpPasswordRetypeInputMismatchErrorText;

  /// No description provided for @signUpPasswordretypeInputemptyErrorText.
  ///
  /// In en, this message translates to:
  /// **'This field can\'t be empty'**
  String get signUpPasswordretypeInputemptyErrorText;

  /// No description provided for @signUpUsernameInputErrorEmptyText.
  ///
  /// In en, this message translates to:
  /// **'Username can\'t be empty'**
  String get signUpUsernameInputErrorEmptyText;

  /// No description provided for @signUpUsernameInputErrorTooShortText.
  ///
  /// In en, this message translates to:
  /// **'Username is too short(at least 6 characters)'**
  String get signUpUsernameInputErrorTooShortText;

  /// No description provided for @signUpConfirmEmailAppBarTitleText.
  ///
  /// In en, this message translates to:
  /// **'Confirm your email'**
  String get signUpConfirmEmailAppBarTitleText;

  /// No description provided for @signUpConfirmEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Activation link was sent'**
  String get signUpConfirmEmailTitle;

  /// No description provided for @signUpConfirmEmailDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent you an activation link to your mailbox. Please open it to finish the process of signing up'**
  String get signUpConfirmEmailDescription;

  /// No description provided for @signUpCompletionFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Express yourself'**
  String get signUpCompletionFormTitle;

  /// No description provided for @signUpCompletionFormSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get signUpCompletionFormSubmitButton;

  /// No description provided for @signUpCompletionDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get signUpCompletionDoneTitle;

  /// No description provided for @signUpCompletionDoneDescription.
  ///
  /// In en, this message translates to:
  /// **'Your account was created successfully. You can start use the app'**
  String get signUpCompletionDoneDescription;

  /// No description provided for @signUpCompletionDoneButtonText.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start!'**
  String get signUpCompletionDoneButtonText;

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counterAppBarTitle;

  /// No description provided for @avatarDialogSaveButtonText.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get avatarDialogSaveButtonText;

  /// No description provided for @avatarDialogChangeAvatarButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Change avatar'**
  String get avatarDialogChangeAvatarButtonLabelText;

  /// No description provided for @avatarDialogAddAvatarButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Add avatar'**
  String get avatarDialogAddAvatarButtonLabelText;

  /// No description provided for @avatarDialogDeleteAvatarButtonLabelText.
  ///
  /// In en, this message translates to:
  /// **'Delete avatar'**
  String get avatarDialogDeleteAvatarButtonLabelText;

  /// No description provided for @avatarDialogCloseButtonTooltipText.
  ///
  /// In en, this message translates to:
  /// **'Close dialog'**
  String get avatarDialogCloseButtonTooltipText;

  /// No description provided for @avatarDialogPickGalleryOptionLabelText.
  ///
  /// In en, this message translates to:
  /// **'gallery'**
  String get avatarDialogPickGalleryOptionLabelText;

  /// No description provided for @avatarDialogCameraOptionLabelText.
  ///
  /// In en, this message translates to:
  /// **'camera'**
  String get avatarDialogCameraOptionLabelText;

  /// No description provided for @badEmailOrPasswordFailureSnackBarText.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email address or password.'**
  String get badEmailOrPasswordFailureSnackBarText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
