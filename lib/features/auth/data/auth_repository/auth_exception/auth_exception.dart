import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

sealed class EIAuthException implements EIException {
  const EIAuthException(this.message);
  @override
  final String message;
}

class SignUpException extends EIAuthException {
  SignUpException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signUpFailSnackBarText;
  }
}

class InvalidAuthDeepLinkException extends EIAuthException {
  InvalidAuthDeepLinkException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.invalidDeepLinkSnackBarText;
  }
}

class SignOutException extends EIAuthException {
  SignOutException(super.message);
  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signOutFailSnackBarText;
  }
}

class SignInException extends EIAuthException {
  SignInException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.signInFailSnackBarText;
  }
}

class PasswordResetLinkSendFailException extends EIAuthException {
  PasswordResetLinkSendFailException(super.message);
  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.passwordResetLinkSentFailSnackBarText;
  }
}

class SetUpNewPasswordException extends EIAuthException {
  SetUpNewPasswordException(super.message);
  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.setNewPasswordFail;
  }
}

class UpdateUserException extends EIAuthException {
  UpdateUserException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.updateUserFail;
  }
}
