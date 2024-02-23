import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

extension EIAuthExceptionUI on EIAuthException {
  String resloveErrorMessageForUser(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      SignUpFail() => l10n.signUpFailSnackBarText,
      SignOutFail() => l10n.signOutFailSnackBarText,
      SignInFail() => l10n.signInFailSnackBarText,
      PasswordResetLinkSendFail() => l10n.passwordResetLinkSentFailSnackBarText,
      InvalidDeepLinkLink() => l10n.invalidDeepLinkSnackBarText,
    };
  }
}
