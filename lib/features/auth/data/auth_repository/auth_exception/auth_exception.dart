import 'package:eco_ideas/common/exceptions/ei_exception.dart';

class EIAuthException extends EIException {
  const EIAuthException({required super.message, super.messageForUser});
}

class AuthFailure implements Exception {}

class SignUpFail extends AuthFailure {}

class SignOutFail extends AuthFailure {}

class BadEmailOrPassword extends AuthFailure {}

class GoogleSignInFail extends AuthFailure {}

class PasswordResetLinkFail extends AuthFailure {}

class PasswordResetSettingUpNewPasswordFail extends AuthFailure {}
