enum AuthStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  AuthRepository();
  Stream<AuthStatus> get status;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signInWithGoogle();

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  });

  Future<void> signOut();
}

// Exceptions
abstract class AuthFailure implements Exception {}

class BadEmailOrPassword extends AuthFailure {}

class GoogleSignInFail extends AuthFailure {}
