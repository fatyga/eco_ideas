import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// TODO(fatyga): Fix imports
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'supabase_auth_repository.g.dart';

@riverpod
FlutterAppAuth flutterAppAuth(FlutterAppAuthRef ref) => const FlutterAppAuth();

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository(this.ref);
  final Ref ref;

  @override
  Stream<AuthStatus> get status async* {
    yield AuthStatus.unknown;
    final initialSession = await ref.read(supabaseAuthProvider).initialSession;

    if (initialSession != null) {
      yield AuthStatus.authenticated;
    } else {
      yield AuthStatus.unauthenticated;
    }

    await for (final supabase.AuthState state
        in ref.read(supabaseClientProvider).auth.onAuthStateChange) {
      if (state.session != null) {
        yield AuthStatus.authenticated;
      } else {
        yield AuthStatus.unauthenticated;
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await ref.read(supabaseClientProvider).auth.signOut();
    } on supabase.AuthException catch (_) {
      throw SignOutFail();
    }
  }

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ref
          .read(supabaseClientProvider)
          .auth
          .signInWithPassword(email: email, password: password);

      if (response.session == null || response.user == null) {
        throw BadEmailOrPassword();
      }
    } on supabase.AuthException catch (_) {
      throw BadEmailOrPassword();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    // Code from https://supabase.com/docs/guides/auth/social-login/auth-google?platform=flutter
    String generateRandomString() {
      final random = Random.secure();
      return base64Url
          .encode(List<int>.generate(16, (_) => random.nextInt(256)));
    }

    // Just a random string
    final rawNonce = generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    /// Client ID that you registered with Google Cloud.
    /// You will have two different values for iOS and Android.
    // TODO(fatyg): find a way to remove null assertion operator
    final clientId = dotenv.env['GOOGLE_OAUTH_CLIENT_ID']!;

    /// reverse DNS form of the client ID + `:/` is set as the redirect URL
    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    /// Fixed value for google login
    const discoveryUrl =
        'https://accounts.google.com/.well-known/openid-configuration';

    final appAuth = ref.read(flutterAppAuthProvider);

    // authorize the user by opening the consent page
    final result = await appAuth.authorize(
      AuthorizationRequest(
        clientId,
        redirectUrl,
        discoveryUrl: discoveryUrl,
        nonce: hashedNonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    if (result == null) {
      throw GoogleSignInFail();
    }

    // Request the access and id token to google
    final tokenResult = await appAuth.token(
      TokenRequest(
        clientId,
        redirectUrl,
        authorizationCode: result.authorizationCode,
        discoveryUrl: discoveryUrl,
        codeVerifier: result.codeVerifier,
        nonce: result.nonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    final idToken = tokenResult?.idToken;

    if (idToken == null) {
      throw GoogleSignInFail();
    }

    try {
      await ref.read(supabaseClientProvider).auth.signInWithIdToken(
            provider: supabase.Provider.google,
            idToken: idToken,
            accessToken: tokenResult?.accessToken,
            nonce: rawNonce,
          );
    } on supabase.AuthException catch (_) {
      throw GoogleSignInFail();
    }
  }

  @override
  Future<String?> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await ref.read(supabaseClientProvider).auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (response.session == null) {
        throw SignUpFail();
      }
      return response.user?.id;
    } on supabase.AuthException catch (_) {
      throw SignUpFail();
    }
  }

  @override
  Future<void> resetPasswordForEmail({required String email}) async {
    await ref.read(supabaseClientProvider).auth.resetPasswordForEmail(
          email,
          redirectTo: dotenv.env['RESET_PASSWORD_REDIRECT_URL'],
        );
  }
}
