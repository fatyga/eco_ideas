class AuthFailure implements Exception {}

class SignUpFail extends AuthFailure {}

class SignOutFail extends AuthFailure {}

class BadEmailOrPassword extends AuthFailure {}

class GoogleSignInFail extends AuthFailure {}
