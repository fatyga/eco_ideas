import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

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

  /// Message inside [SnackBar], which informs user about unexpected(unhandled) exception
  ///
  /// In en, this message translates to:
  /// **'Unexpected error occurred'**
  String get unknown_exception;

  /// Indicates, that the form field must be filled.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// Content for a button, which do some task.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Label of email address form field.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// Indicates, that value entered to form field is incorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect format'**
  String get incorrectFormat;

  /// Label of password form field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label of password form field, where user have to reenter a password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @tooShortPassword.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters are required.'**
  String get tooShortPassword;

  /// No description provided for @digitIsRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one digit is required'**
  String get digitIsRequired;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords are mismatched'**
  String get passwordMismatch;

  /// Message inside [Snackbar], which informs user, that incorrect credentials was provided
  ///
  /// In en, this message translates to:
  /// **'Invalid login credentials'**
  String get invalid_credentials;

  /// No description provided for @emailSignInForm_submit.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get emailSignInForm_submit;

  /// No description provided for @change_signIn_method.
  ///
  /// In en, this message translates to:
  /// **'Change login method'**
  String get change_signIn_method;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email address'**
  String get continueWithEmail;

  /// No description provided for @signInScreenFooter_forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get signInScreenFooter_forgotPassword;

  /// No description provided for @signInScreenFooter_createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signInScreenFooter_createAccount;

  /// No description provided for @resetYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetYourPassword;

  /// No description provided for @passwordResetFirstStepScreen_appBar_title.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get passwordResetFirstStepScreen_appBar_title;

  /// No description provided for @passwordResetSecondStepScreen_appBar_title.
  ///
  /// In en, this message translates to:
  /// **'Provide new password'**
  String get passwordResetSecondStepScreen_appBar_title;

  /// No description provided for @passwordResetFirstStep_description.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email address with which your account was created.'**
  String get passwordResetFirstStep_description;

  /// No description provided for @passwordResetSecondStep_description.
  ///
  /// In en, this message translates to:
  /// **'In order to finish password reset procedure, please provide new password.'**
  String get passwordResetSecondStep_description;

  /// No description provided for @passwordResetLinkSent_title.
  ///
  /// In en, this message translates to:
  /// **'Link was sent!'**
  String get passwordResetLinkSent_title;

  /// No description provided for @passwordResetLinkSent_description.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a link to given email address. Please open it to finish the process of resetting password.'**
  String get passwordResetLinkSent_description;

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

  /// Label of username form field
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Label of button, which fires up registration
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Title of [Appbar], which informs, that user have to choose one of available sign up methods
  ///
  /// In en, this message translates to:
  /// **'Choose sign up method'**
  String get choose_signUp_method;

  /// No description provided for @change_signUp_method.
  ///
  /// In en, this message translates to:
  /// **'Change sign up method'**
  String get change_signUp_method;

  /// Informs user, that email confirmation link was sent
  ///
  /// In en, this message translates to:
  /// **'Email confirmation link sent'**
  String get emailConfirmationLinkSent;

  /// Informs user, that email with link was sent
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent you email with confirmation link'**
  String get emailConfirmation;

  /// Label for button, which take user to screen, where he can explore ideas
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// Label for button, which take user to screen with his ideas
  ///
  /// In en, this message translates to:
  /// **'My ideas'**
  String get myIdeas;

  /// Label for button, which takes user to screen with his profile information
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// Label of text field for title of idea/step
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Helper text of text field for title of idea.
  ///
  /// In en, this message translates to:
  /// **'Keep it concise and encouraging.'**
  String get titleHelperText;

  /// Label of text field for description of idea/step
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Helper text of text field for description of idea.
  ///
  /// In en, this message translates to:
  /// **'In a few words familiarise users with your idea.'**
  String get descriptionHelperText;

  /// Informs user, that he is on screen for editing his profile
  ///
  /// In en, this message translates to:
  /// **'Edit your profile'**
  String get editYourProfile;

  /// Headline of section, where user creates new idea
  ///
  /// In en, this message translates to:
  /// **'Create new idea'**
  String get createIdea;

  /// No description provided for @createIdeaAndProceedToEditor.
  ///
  /// In en, this message translates to:
  /// **'Create and proceed to editor'**
  String get createIdeaAndProceedToEditor;

  /// Label of text field for user name and surname
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// Label of text field for user bio
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;
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
