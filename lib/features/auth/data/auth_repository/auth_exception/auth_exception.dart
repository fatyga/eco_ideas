import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

sealed class EIAuthException implements EIException {
  const EIAuthException();
}

class SignUpFail implements EIAuthException {
  @override
  String get message => 'Fail to create new user account.';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signUpFailSnackBarText;
  }
}

class InvalidDeepLink implements EIAuthException {
  @override
  String get message => 'Link is invalid, or was opened more than once';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.invalidDeepLinkSnackBarText;
  }
}

class SignOutFail implements EIAuthException {
  @override
  String get message => 'Failed to sign out the current user.';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signOutFailSnackBarText;
  }
}

class SignInFail implements EIAuthException {
  @override
  String get message =>
      '''There is no account for provided credentials, or account does not exists.''';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signInFailSnackBarText;
  }
}

class PasswordResetLinkSendFail implements EIAuthException {
  @override
  String get message => 'Fail to send password reset link.';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.passwordResetLinkSentFailSnackBarText;
  }
}

class SetUpNewPasswordFail implements EIAuthException {
  @override
  String get message => 'Fail to set up new password.';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.setNewPasswordFail;
  }
}

class UpdateUserFail implements EIAuthException {
  @override
  String get message => 'Fail to update user account';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.updateUserFail;
  }
}
