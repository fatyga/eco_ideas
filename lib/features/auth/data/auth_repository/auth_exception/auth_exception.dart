import 'package:eco_ideas/common/exceptions/ei_exception.dart';

sealed class EIAuthException extends EIException {
  const EIAuthException({
    required super.message,
  });
}

class SignUpFail implements EIAuthException {
  @override
  String get message => '';
}

class InvalidConfirmEmailLink implements EIAuthException {
  @override
  String get message => 'Link is invalid, or was opened more than once';
}

class SignOutFail implements EIAuthException {
  @override
  String get message => 'Failed to sign out the current user.';
}

class BadEmailOrPassword implements EIAuthException {
  @override
  String get message =>
      'There is no account for provided credentials, or account does not exists.';
}

class GoogleSignInFail implements EIAuthException {
  @override
  String get message => '';
}

class FailToSendPasswordResetLink implements EIAuthException {
  @override
  String get message => '';
}

class InvalidPasswordResetLink implements EIAuthException {
  @override
  String get message => 'Link is invalid, or was opened more than once.';
}

class PasswordResetSettingUpNewPasswordFail implements EIException {
  @override
  String get message => '';
}
