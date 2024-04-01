import 'package:eco_ideas/common/providers/supabase_provider/supabase_provider.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      final event = state.event;

      switch (event) {
        case supabase.AuthChangeEvent.signedIn:
        case supabase.AuthChangeEvent.tokenRefreshed:
        case supabase.AuthChangeEvent.userUpdated:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          yield AuthStatus.authenticated;
        case supabase.AuthChangeEvent.passwordRecovery:
          yield AuthStatus.passwordReset;
        case supabase.AuthChangeEvent.signedOut:
        case supabase.AuthChangeEvent.userDeleted:
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
      await ref
          .read(supabaseClientProvider)
          .auth
          .signInWithPassword(email: email, password: password);
    } on supabase.AuthException catch (_) {
      throw SignInFail();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    /// Web Client ID that you registered with Google Cloud.
    final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];

    // /// iOS Client ID that you registered with Google Cloud.
    // const iosClientId = 'my-ios.apps.googleusercontent.com';

    final googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw SignInFail();
    }
    if (idToken == null) {
      throw SignInFail();
    }

    await ref.read(supabaseClientProvider).auth.signInWithIdToken(
          provider: supabase.Provider.google,
          idToken: idToken,
          accessToken: accessToken,
        );
  }

  @override
  Future<String?> signUpWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final response = await ref.read(supabaseClientProvider).auth.signUp(
        emailRedirectTo: dotenv.env['SIGN_UP_COMPLETION_REDIRECT_URL'],
        email: email,
        password: password,
        data: {
          'username': username,

          // TODO(fatyga): find a way to remove null assertion operator
          dotenv.env['SIGN_UP_COMPLETION_FLAG_NAME']!: false,
        },
      );

      return response.user?.id;
    } on supabase.AuthException catch (_) {
      throw SignUpFail();
    }
  }

  @override
  Future<void> resetPasswordForEmail({required String email}) async {
    try {
      await ref.read(supabaseClientProvider).auth.resetPasswordForEmail(
            email,
            redirectTo: dotenv.env['RESET_PASSWORD_REDIRECT_URL'],
          );
    } on supabase.AuthException catch (_) {
      throw PasswordResetLinkSendFail();
    }
  }

  @override
  Future<void> setNewPassword({required String newPassword}) async {
    try {
      await ref
          .read(supabaseClientProvider)
          .auth
          .updateUser(supabase.UserAttributes(password: newPassword));
    } on supabase.AuthException catch (_) {
      throw SetUpNewPasswordFail();
    }
  }

  @override
  void determineInvalidDeepLink(Uri deepLink) {
    if (deepLink.fragment.contains('error_code=401')) {
      throw InvalidDeepLink();
    }
  }
}
