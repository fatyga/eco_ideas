import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class Listener<T> extends Mock {
  void call(T? current, T next);
}

void main() {
  ProviderContainer makeProviderContainer({AuthRepository? authRepository}) {
    final container = ProviderContainer(
      overrides: [
        if (authRepository != null)
          authRepositoryProvider.overrideWithValue(authRepository)
      ],
    );

    addTearDown(container.dispose);
    return container;
  }

  SignInController createSubject() {
    return SignInController();
  }

  group('signInController', () {
    group('constructor', () {
      test('initial state is AsyncData', () {
        final mockAuthRepository = MockAuthRepository();
        final container =
            makeProviderContainer(authRepository: mockAuthRepository);

        final listener = Listener<AsyncValue<SignInState>>();

        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        verify(() =>
                listener(null, const AsyncData<SignInState>(SignInState())))
            .called(1);

        verifyNoMoreInteractions(listener);
      });
    });

    group('updateEmailField', () {
      test('set email to EmailInput.pure() when newValue is empty', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signInControllerProvider.notifier);

        controller.updateEmailField('some_email');

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
        ]);

        verifyNoMoreInteractions(listener);
      });
    });
  });
}
