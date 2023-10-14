import 'package:eco_ideas/features/auth/data/auth_repository/supabase_auth_repository/supabase_auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/features/auth/domain/user_profile/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

// Provider for AuthRepository
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    SupabaseAuthRepository(ref);

// StreamProvider for authentication status changes.
@riverpod
Stream<AuthStatus> authChanges(AuthChangesRef ref) =>
    ref.watch(authRepositoryProvider).status;

abstract class AuthRepository {
  AuthRepository();

  UserProfileUID? get currentUserUID;
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

class SignInFail extends AuthFailure {}

class SignOutFail extends AuthFailure {}

class BadEmailOrPassword extends AuthFailure {}

class GoogleSignInFail extends AuthFailure {}
