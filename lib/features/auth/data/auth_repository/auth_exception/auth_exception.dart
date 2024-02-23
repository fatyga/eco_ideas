import 'package:eco_ideas/common/exceptions/ei_exception.dart';

sealed class EIAuthException extends EIException {
  const EIAuthException({
    required super.message,
  });
}

class SignUpFail implements EIAuthException {
  @override
  String get message => 'Fail to create new user account.';
}

class InvalidDeepLinkLink implements EIAuthException {
  @override
  String get message => 'Link is invalid, or was opened more than once';
}

class SignOutFail implements EIAuthException {
  @override
  String get message => 'Failed to sign out the current user.';
}

class SignInFail implements EIAuthException {
  @override
  String get message =>
      'There is no account for provided credentials, or account does not exists.';
}

class PasswordResetLinkSendFail implements EIAuthException {
  @override
  String get message => 'Fail to send password reset link.';
}

class SetUpNewPasswordFail implements EIException {
  @override
  String get message => 'Fail to set up new password.';
}
