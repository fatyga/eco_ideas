import 'package:eco_ideas/features/auth/data/auth_repository/supabase_auth_repository/supabase_auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';

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

  // Returns true or throw an error
  Future<bool> resetPasswordForEmail({required String email});

  Future<void> setNewPassword({required String newPassword});

  // Method which throw an error if given [deepLink] is invalid
  void determineInvalidDeepLink(Uri deepLink);
}
