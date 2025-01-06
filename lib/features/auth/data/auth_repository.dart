import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepository(client: ref.read(goTrueClientProvider));

@riverpod
Stream<AuthState> authChanges(Ref ref) =>
    ref.read(authRepositoryProvider).authChanges;

/// Class which interacts with SupabaseAuth API.
class AuthRepository {
  const AuthRepository({required this.client});

  final GoTrueClient client;

  /// Notifies about authentication-related events.
  Stream<AuthState> get authChanges => client.onAuthStateChange;

  /// Creates new user with email as identity.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await client.signUp(email: email, password: password);
  }

  /// Signs in user with email as identity.
  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return client.signInWithPassword(email: email, password: password);
  }

  /// Signs out current user, if it exists.
  Future<void> signOut() async {
    await client.signOut();
  }
}
