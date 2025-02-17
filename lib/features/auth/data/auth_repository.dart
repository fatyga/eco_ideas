import 'package:eco_ideas/utils/supabase_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  // AUTHENTICATION

  /// Notifies about authentication-related events.
  Stream<AuthState> get authChanges => client.onAuthStateChange;

  Future<void> signInWithGoogle() async {
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];

    final iosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'];

    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await client.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  /// Creates new user with email as identity.
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String username,
    required String password,
  }) async {
    await client.signUp(
      email: email,
      password: password,
      data: {'display_name': username},
    );
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

  /// Sends link, which allow to reset password
  Future<void> resetPasswordForEmail({
    required String email,
  }) async {
    await client.resetPasswordForEmail(email,
        redirectTo: dotenv.env['RESET_PASSWORD_REDIRECT_URL'],);
  }

  /// Update user account with provided password
  Future<void> setNewPassword(String password) async {
    await client.updateUser(UserAttributes(password: password));
  }


}
