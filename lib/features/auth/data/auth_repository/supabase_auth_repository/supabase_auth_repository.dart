import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// TODO(fatyga): Fix imports
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'supabase_auth_repository.g.dart';

@riverpod
SupabaseAuthRepository supabaseAuthRepository(SupabaseAuthRepositoryRef ref) =>
    SupabaseAuthRepository(ref);

@riverpod
supabase.GoTrueClient goTrueClient(GoTrueClientRef ref) =>
    supabase.Supabase.instance.client.auth;

@riverpod
Stream<AuthStatus> authChanges(AuthChangesRef ref) =>
    ref.watch(supabaseAuthRepositoryProvider).status;

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository(this.ref);
  final Ref ref;

  @override
  Stream<AuthStatus> get status => ref
          .read(goTrueClientProvider)
          .onAuthStateChange
          .map((supabase.AuthState authState) {
        switch (authState.event) {
          case supabase.AuthChangeEvent.signedIn:
          case supabase.AuthChangeEvent.userUpdated:
          case supabase.AuthChangeEvent.passwordRecovery:
            return AuthStatus.authenticated;

          case supabase.AuthChangeEvent.signedOut:
          case supabase.AuthChangeEvent.userDeleted:
            return AuthStatus.unauthenticated;

          // TODO(fatyga): Check whether this cases should return AuthStatus.unknown.
          case supabase.AuthChangeEvent.tokenRefreshed:
          case supabase.AuthChangeEvent.mfaChallengeVerified:
            return AuthStatus.unknown;
        }
      });

  @override
  Future<void> signOut() async {
    await ref.read(goTrueClientProvider).signOut();
  }

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await ref
        .read(goTrueClientProvider)
        .signInWithPassword(email: email, password: password);
    if (response.user == null) {
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
    const clientId = 'YOUR_CLIENT_ID_HERE';

    /// reverse DNS form of the client ID + `:/` is set as the redirect URL
    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    /// Fixed value for google login
    const discoveryUrl =
        'https://accounts.google.com/.well-known/openid-configuration';

    const appAuth = FlutterAppAuth();

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
      throw 'Could not find AuthorizationResponse after authorizing';
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
      throw 'Could not find idToken from the token response';
    }

    await ref.read(goTrueClientProvider).signInWithIdToken(
          provider: supabase.Provider.google,
          idToken: idToken,
          accessToken: tokenResult?.accessToken,
          nonce: rawNonce,
        );
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    await ref.read(goTrueClientProvider).signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
  }
}