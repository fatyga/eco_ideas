import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/supabase_auth_repository/supabase_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockAuthResponse extends Mock implements AuthResponse {}

class MockAuthException extends Mock implements AuthException {}

ProviderContainer createContainer(MockGoTrueClient goTrueClient) {
  final container = ProviderContainer(
    overrides: [goTrueClientProvider.overrideWith((ref) => goTrueClient)],
  );

  addTearDown(container.dispose);

  return container;
}

void main() {
  group('SupabaseAuthRepository', () {
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
  });
}
