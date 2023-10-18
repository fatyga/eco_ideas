import 'dart:async';

import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/supabase_auth_repository/supabase_auth_repository.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockAuthException extends Mock implements AuthException {}

class MockSession extends Mock implements Session {}

class MockUser extends Mock implements User {}

class MockAuthState extends Mock implements AuthState {}

ProviderContainer createContainer(MockGoTrueClient goTrueClient) {
  final container = ProviderContainer(
    overrides: [goTrueClientProvider.overrideWith((ref) => goTrueClient)],
  );

  addTearDown(container.dispose);

  return container;
}

void main() {
  group('SupabaseAuthRepository', () {
    group('status', () {
      test('returns AuthStatus.unknown if AuthChangeEvent.tokenRefreshed', () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.tokenRefreshed;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.unknown),
        );
      });

      test('returns AuthStatus.unknown if AuthChangeEvent.mfaChallengeVerified',
          () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.mfaChallengeVerified;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.unknown),
        );
      });

      test('returns AuthStatus.unauthenticated if AuthChangeEvent.signedOut',
          () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.signedOut;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.unauthenticated),
        );
      });

      test('returns AuthStatus.unauthenticated if AuthChangeEvent.userDeleted',
          () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.userDeleted;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.unauthenticated),
        );
      });

      test('returns AuthStatus.authenticated if AuthChangeEvent.signedIn', () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.signedIn;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.authenticated),
        );
      });

      test('returns AuthStatus.authenticated if AuthChangeEvent.userUpdated',
          () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.userUpdated;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.authenticated),
        );
      });

      test(
          'returns AuthStatus.authenticated if AuthChangeEvent.passwordRecovery',
          () {
        final goTrueClient = MockGoTrueClient();

        final authState = MockAuthState();
        const event = AuthChangeEvent.passwordRecovery;
        when(() => authState.event).thenReturn(event);

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => Stream.value(authState));

        final container = createContainer(goTrueClient);

        expect(
          container.read(authRepositoryProvider).status,
          emits(AuthStatus.authenticated),
        );
      });
    });
    group('signOut', () {
      test('invokes GoTrueClient.signOut method', () async {
        final goTrueClient = MockGoTrueClient();

        when(goTrueClient.signOut).thenAnswer((_) => Future.value());
        final container = createContainer(goTrueClient);

        await container.read(authRepositoryProvider).signOut();

        verify(() => container.read(goTrueClientProvider).signOut()).called(1);
      });

      test('throws SignOutFail, if GoTrueClient.signOut throws AuthException',
          () async {
        final goTrueClient = MockGoTrueClient();

        when(goTrueClient.signOut).thenThrow(MockAuthException());
        final container = createContainer(goTrueClient);

        expect(
          () async => container.read(authRepositoryProvider).signOut(),
          throwsA(isA<SignOutFail>()),
        );
      });
    });

    group('signInWithEmail', () {
      const email = 'email@domain.com';
      const password = 'qwerty';
      test('invokes GoTrueClient.signInWithPassword method', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final session = MockSession();
        final user = MockUser();

        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(session);
        when(() => authResponse.user).thenReturn(user);
        when(
          () => goTrueClient.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => authResponse);

        await container
            .read(authRepositoryProvider)
            .signInWithEmail(email: email, password: password);

        verify(
          () => goTrueClient.signInWithPassword(
            email: email,
            password: password,
          ),
        ).called(1);
      });

      test('throws BadEmailOrPassword, if sesssion is null', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(null);

        when(
          () => goTrueClient.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => authResponse);

        expect(
          () async => container
              .read(authRepositoryProvider)
              .signInWithEmail(email: email, password: password),
          throwsA(isA<BadEmailOrPassword>()),
        );
      });

      test('throws BadEmailOrPassword, if user is null', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final session = MockSession();

        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(session);
        when(() => authResponse.user).thenReturn(null);
        when(
          () => goTrueClient.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => authResponse);

        expect(
          () async => container
              .read(authRepositoryProvider)
              .signInWithEmail(email: email, password: password),
          throwsA(isA<BadEmailOrPassword>()),
        );
      });

      test(
          'throws BadEmailOrPassword, if GoTrueClient.signInWithPassword throws',
          () async {
        final goTrueClient = MockGoTrueClient();
        final exception = MockAuthException();

        final container = createContainer(goTrueClient);

        when(
          () => goTrueClient.signInWithPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(exception);

        expect(
          () async => container
              .read(authRepositoryProvider)
              .signInWithEmail(email: email, password: password),
          throwsA(isA<BadEmailOrPassword>()),
        );
      });
    });

    group('signUpWithEmail', () {
      const email = 'email@domain.com';
      const password = 'qwerty';
      const username = 'johnDoe';
      final data = {'username': username};

      test('invokes GoTrueClient.signUp method', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final session = MockSession();
        final user = MockUser();

        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(session);
        when(() => authResponse.user).thenReturn(user);

        when(
          () => goTrueClient.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
            data: data,
          ),
        ).thenAnswer((_) async => authResponse);

        await container.read(authRepositoryProvider).signUpWithEmail(
              email: email,
              password: password,
              username: username,
            );
        verify(
          () =>
              goTrueClient.signUp(email: email, password: password, data: data),
        ).called(1);
      });

      test('throws SignUpFail, if sesssion is null', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(null);

        when(
          () => goTrueClient.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
            data: data,
          ),
        ).thenAnswer((_) async => authResponse);

        expect(
          () async => container.read(authRepositoryProvider).signUpWithEmail(
                email: email,
                password: password,
                username: username,
              ),
          throwsA(isA<SignUpFail>()),
        );
      });

      test('throws SignUpFail, if user is null', () async {
        final goTrueClient = MockGoTrueClient();
        final authResponse = MockAuthResponse();
        final session = MockSession();

        final container = createContainer(goTrueClient);

        when(() => authResponse.session).thenReturn(session);
        when(() => authResponse.user).thenReturn(null);

        when(
          () => goTrueClient.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
            data: data,
          ),
        ).thenAnswer((_) async => authResponse);

        expect(
          () async => container.read(authRepositoryProvider).signUpWithEmail(
                email: email,
                password: password,
                username: username,
              ),
          throwsA(isA<SignUpFail>()),
        );
      });

      test('throws SignUpFail, if GoTrueClient.signUp throws', () async {
        final goTrueClient = MockGoTrueClient();
        final exception = MockAuthException();

        final container = createContainer(goTrueClient);

        when(
          () => goTrueClient.signUp(
            email: any(named: 'email'),
            password: any(named: 'password'),
            data: data,
          ),
        ).thenThrow(exception);

        expect(
          () async => container.read(authRepositoryProvider).signUpWithEmail(
                email: email,
                password: password,
                username: username,
              ),
          throwsA(isA<SignUpFail>()),
        );
      });
    });
  });
}
