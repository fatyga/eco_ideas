import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_repository.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/supabase_auth_repository/supabase_auth_repository.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements SupabaseAuthRepository {}

class Listener<T> extends Mock {
  void call(T? current, T next);
}

void main() {
  ProviderContainer makeProviderContainer({AuthRepository? authRepository}) {
    final container = ProviderContainer(
      overrides: [
        if (authRepository != null)
          authRepositoryProvider.overrideWithValue(authRepository),
      ],
    );

    addTearDown(container.dispose);
    return container;
  }

  group('signInController', () {
    const invalidEmail = 'john.2!@#@w';
    const validEmail = 'john.doe@gmail.com';

    const validPassword = 'qwerty123';
    const tooShortPassword = 'qwert';

    registerFallbackValue(const SignInState());
    registerFallbackValue(const AsyncLoading<SignInState>());
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

        verify(
          () => listener(null, const AsyncData<SignInState>(SignInState())),
        ).called(1);

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

        container.read(signInControllerProvider.notifier).updateEmailField('');

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(SignInState()),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });

      test('''
set email to EmailInput.dirty() and overwrite isValid when
           newValue is not empty and invalid''', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        container
            .read(signInControllerProvider.notifier)
            .updateEmailField(invalidEmail);

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: invalidEmail),
                  ),
                ),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });

      test('''
set email to EmailInput.dirty() and overwrite isValid when newValue is
           not empty and valid''', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        container
            .read(signInControllerProvider.notifier)
            .updateEmailField(validEmail);

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                  ),
                ),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });
    });

    group('updatePasswordField', () {
      test('sets password to PasswordInput.pure() when value is empty', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        container
            .read(signInControllerProvider.notifier)
            .updatePasswordField('');

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(SignInState()),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });

      test('''
set email to PasswordInput.dirty() and overwrite isValid when
           newValue is not empty and too short''', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        container
            .read(signInControllerProvider.notifier)
            .updatePasswordField(tooShortPassword);

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(
                    password: PasswordInput.dirty(value: tooShortPassword),
                  ),
                ),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });

      test('''
set email to PasswordInput.dirty() and overwrite isValid when
           newValue is not empty and valid''', () {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        container
            .read(signInControllerProvider.notifier)
            .updateEmailField(validPassword);

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validPassword),
                  ),
                ),
              ),
        ]);

        verifyNoMoreInteractions(listener);
      });
    });

    group('signInWithEmail', () {
      test('''does nothing when state.isValid == false''', () async {
        final container = makeProviderContainer();
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signInControllerProvider.notifier);

        await controller.signInWithEmail();

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
        ]);
        verifyNoMoreInteractions(listener);
      });

      test('sign-in success', () async {
        final authRepository = MockAuthRepository();
        when(
          () => authRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) => Future.value());
        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signInControllerProvider.notifier)
          ..updateEmailField(validEmail)
          ..updatePasswordField(validPassword);

        await controller.signInWithEmail();

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(email: EmailInput.dirty(value: validEmail)),
                ),
              ),
          () => listener.call(
                const AsyncData<SignInState>(
                  SignInState(email: EmailInput.dirty(value: validEmail)),
                ),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                    password: PasswordInput.dirty(value: validPassword),
                  ),
                ),
              ),
          () => listener.call(
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                    password: PasswordInput.dirty(value: validPassword),
                  ),
                ),
                any(that: isA<AsyncLoading<SignInState>>()),
              ),
          () => listener.call(
                any(that: isA<AsyncLoading<SignInState>>()),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                    password: PasswordInput.dirty(value: validPassword),
                  ),
                ),
              ),
        ]);

        verify(
          () => authRepository.signInWithEmail(
            email: validEmail,
            password: validPassword,
          ),
        ).called(1);
        verifyNoMoreInteractions(listener);
      });

      test('sign-in fail', () async {
        final authRepository = MockAuthRepository();
        when(
          () => authRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(BadEmailOrPassword());
        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<SignInState>>();
        container.listen(
          signInControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signInControllerProvider.notifier)
          ..updateEmailField(validEmail)
          ..updatePasswordField(validPassword);
        await controller.signInWithEmail();

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignInState>(SignInState())),
          () => listener.call(
                const AsyncData<SignInState>(SignInState()),
                const AsyncData<SignInState>(
                  SignInState(email: EmailInput.dirty(value: validEmail)),
                ),
              ),
          () => listener.call(
                const AsyncData<SignInState>(
                  SignInState(email: EmailInput.dirty(value: validEmail)),
                ),
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                    password: PasswordInput.dirty(value: validPassword),
                  ),
                ),
              ),
          () => listener.call(
                const AsyncData<SignInState>(
                  SignInState(
                    email: EmailInput.dirty(value: validEmail),
                    password: PasswordInput.dirty(value: validPassword),
                  ),
                ),
                any(that: isA<AsyncLoading<SignInState>>()),
              ),
          () => listener.call(
                any(that: isA<AsyncLoading<SignInState>>()),
                any(that: isA<AsyncError<SignInState>>()),
              ),
        ]);

        verify(
          () => authRepository.signInWithEmail(
            email: validEmail,
            password: validPassword,
          ),
        ).called(1);
        verifyNoMoreInteractions(listener);
      });
    });
  });
}
