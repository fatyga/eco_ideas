enum AuthStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  Stream<AuthStatus> get status;

  Future<void> signInWithEmail(
      {required String email, required String password});

  Future<void> signInWithGoogle();

  Future<void> signUpWithEmail(
      {required String email, required String password});

  Future<void> signUpWithGoogle();

  Future<void> logOut();
}

// Exceptions
abstract class AuthException implements Exception {}

class UserNotFoundException extends AuthException {}

class InvalidPasswordException extends AuthException {}
