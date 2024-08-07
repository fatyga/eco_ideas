import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/domain/auth_status.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/controller/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class Listener<T> extends Mock {
  void call(T? current, T next);
}

void main() {
  ProviderContainer makeProviderContainer({
    AuthRepository? authRepository,
    Stream<AuthStatus>? authChangesStream,
  }) {
    final container = ProviderContainer(
      overrides: [
        if (authRepository != null)
          authRepositoryProvider.overrideWith((_) => authRepository),
        if (authChangesStream != null)
          authChangesProvider.overrideWith((_) => authChangesStream),
      ],
    );

    addTearDown(container.dispose);
    return container;
  }

  group('PasswordResetSecondStepController', () {
    setUpAll(() {
      registerFallbackValue(const AsyncLoading<PasswordResetSecondStepState>());
    });
    group('build method', () {
      test('returns AsyncData<PasswordResetSecondStepState> instance', () {
        final container = makeProviderContainer();

        final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();

        container.listen(
          passwordResetSecondStepControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        verify(
          () => listener(
            null,
            const AsyncData<PasswordResetSecondStepState>(
              PasswordResetSecondStepState(),
            ),
          ),
        );
      });
    });

    group('fields updating', () {
      group('passwordInput', () {
        const validValue = 'Qwerty1!';
        const invalidValue = 'qwerty123';

        test(
          '''
set passwordInput to RestrictedPasswordInput.pure() when new value is empty''',
          () {
            final container = makeProviderContainer();
            final listener =
                Listener<AsyncValue<PasswordResetSecondStepState>>();
            container.listen(
              passwordResetSecondStepControllerProvider,
              listener.call,
              fireImmediately: true,
            );

            final controller = container
                .read(passwordResetSecondStepControllerProvider.notifier)
              ..updatePasswordField('');

            verifyInOrder([
              () => listener.call(
                    null,
                    const AsyncData<PasswordResetSecondStepState>(
                      PasswordResetSecondStepState(),
                    ),
                  ),
              () => listener.call(
                    const AsyncData<PasswordResetSecondStepState>(
                      PasswordResetSecondStepState(),
                    ),
                    const AsyncData<PasswordResetSecondStepState>(
                      PasswordResetSecondStepState(),
                    ),
                  ),
            ]);

            expect(
              controller.state.requireValue.passwordInput.isPure,
              equals(true),
            );

            expect(
              controller.state.requireValue.passwordInput.value,
              equals(''),
            );

            verifyNoMoreInteractions(listener);
          },
        );

        test('''
set passwordInput to RestrictedPasswordInput.dirty(value: newValue) when [newValue] is provided''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier)
            ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: validValue),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.passwordInput.value,
            equals(validValue),
          );
          verifyNoMoreInteractions(listener);
        });

        test('''
if passwordInput with entered value is invalid, passwordRetypeInput stays untouched''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier)
            ..updatePasswordField(invalidValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: invalidValue),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.passwordInput.value,
            equals(invalidValue),
          );

          expect(
            controller.state.requireValue.passwordInput.isValid,
            equals(false),
          );
          verifyNoMoreInteractions(listener);
        });
        test('''
if [newValue] is valid && passwordRetypeInput is pure, update passwordRetypeInput's [passwordToMatch] to [newValue]''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier)
            ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: validValue),
                      passwordRetypeInput: PasswordRetypeInput.pure(
                        passwordToMatch: validValue,
                      ),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordInput.isPure,
            equals(false),
          );
          expect(
            controller.state.requireValue.passwordInput.value,
            equals(validValue),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.isPure,
            equals(true),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.passwordToMatch,
            equals(validValue),
          );

          verifyNoMoreInteractions(listener);
        });

        test('''
if [newValue] is valid && passwordRetypeInput is dirty, update passwordRetypeInput's [passwordToMatch] to [newValue] and persist its value''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          const passwordRetypeInputValue = 'zaq123';
          final controller =
              container.read(passwordResetSecondStepControllerProvider.notifier)
                ..updatePasswordRetypeField(passwordRetypeInputValue)
                ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordRetypeInputValue,
                      ),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordRetypeInputValue,
                      ),
                    ),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: validValue),
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordRetypeInputValue,
                        passwordToMatch: validValue,
                      ),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordInput.isPure,
            equals(false),
          );
          expect(
            controller.state.requireValue.passwordInput.value,
            equals(validValue),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.passwordToMatch,
            equals(validValue),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.value,
            equals(passwordRetypeInputValue),
          );

          verifyNoMoreInteractions(listener);
        });
      });

      group('passwordRetypeInput', () {
        const enteredValue = 'Qwerty1!';

        test('''
set passwordRetypeInput to PasswordRetypeInput.pure() when newValue is empty and passwordInput.isValid is false''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier)
            ..updatePasswordRetypeField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordRetypeInput.isPure,
            equals(true),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.value,
            equals(''),
          );

          verifyNoMoreInteractions(listener);
        });

        test('''
if [newValue] is empty, and [passwordInput.isValid] is true, then [passwordToMatch] should be updated to passwordInput.value''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller =
              container.read(passwordResetSecondStepControllerProvider.notifier)
                ..updatePasswordField(enteredValue)
                ..updatePasswordRetypeField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: enteredValue),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: enteredValue),
                    ),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: enteredValue),
                      passwordRetypeInput: PasswordRetypeInput.pure(
                        passwordToMatch: enteredValue,
                      ),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordRetypeInput.isPure,
            equals(true),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.value,
            equals(''),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.passwordToMatch,
            equals(enteredValue),
          );
          verifyNoMoreInteractions(listener);
        });

        test('''
set passwordRetypeInput to PasswordRetypeInput.dirty(value: newValue) when [newValue] is provided''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          const passwordFieldValue = 'Zaq!123';
          final controller =
              container.read(passwordResetSecondStepControllerProvider.notifier)
                ..updatePasswordField(passwordFieldValue)
                ..updatePasswordRetypeField(enteredValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordFieldValue,
                      ),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordFieldValue,
                      ),
                    ),
                  ),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordFieldValue,
                      ),
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: enteredValue,
                        passwordToMatch: passwordFieldValue,
                      ),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordRetypeInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.value,
            equals(enteredValue),
          );

          expect(
            controller.state.requireValue.passwordRetypeInput.passwordToMatch,
            equals(passwordFieldValue),
          );
          verifyNoMoreInteractions(listener);
        });
      });
    });

    group('setNewPassword', () {
      const validPassword = 'Qwerty1!';
      test('does nothing, when state.isValid == false', () async {
        final authRepository = MockAuthRepository();

        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
        container.listen(
          passwordResetSecondStepControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller =
            container.read(passwordResetSecondStepControllerProvider.notifier);
        await controller.setNewPassword();

        verifyInOrder([
          () => listener.call(
                null,
                const AsyncData<PasswordResetSecondStepState>(
                  PasswordResetSecondStepState(),
                ),
              ),
        ]);

        verifyNever(
          () => authRepository.setNewPassword(
            newPassword: any(named: 'newPassword'),
          ),
        );
      });

      test(
        '''
if stateValue.isValid, invokes AuthRepository.setNewPassword with correct value''',
        () async {
          const passwordValue = validPassword;
          final authRepository = MockAuthRepository();

          when(
            () => authRepository.setNewPassword(
              newPassword: any(named: 'newPassword'),
            ),
          ).thenAnswer((_) => Future.value());

          final container =
              makeProviderContainer(authRepository: authRepository);
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller =
              container.read(passwordResetSecondStepControllerProvider.notifier)
                ..updatePasswordField(passwordValue)
                ..updatePasswordRetypeField(passwordValue);

          await controller.setNewPassword();

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordValue,
                      ),
                      passwordRetypeInput:
                          PasswordRetypeInput.dirty(value: passwordValue),
                    ),
                  ),
                  any(that: isA<AsyncLoading<PasswordResetSecondStepState>>()),
                ),
            () => listener.call(
                  any(that: isA<AsyncLoading<PasswordResetSecondStepState>>()),
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordValue,
                      ),
                      passwordRetypeInput:
                          PasswordRetypeInput.dirty(value: passwordValue),
                    ),
                  ),
                ),
          ]);

          verify(
            () => authRepository.setNewPassword(
              newPassword: passwordValue,
            ),
          ).called(1);
        },
      );

      test(
        'emits AsyncError, when AuthRepository.setNewPassword throws an error',
        () async {
          const passwordValue = validPassword;
          final authRepository = MockAuthRepository();

          when(
            () => authRepository.setNewPassword(
              newPassword: validPassword,
            ),
          ).thenThrow(SetUpNewPasswordException());

          final container =
              makeProviderContainer(authRepository: authRepository);
          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();
          container.listen(
            passwordResetSecondStepControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller =
              container.read(passwordResetSecondStepControllerProvider.notifier)
                ..updatePasswordField(passwordValue)
                ..updatePasswordRetypeField(passwordValue);

          await controller.setNewPassword();

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(),
                  ),
                ),
            () => listener.call(
                  const AsyncData<PasswordResetSecondStepState>(
                    PasswordResetSecondStepState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordValue,
                      ),
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordValue,
                        passwordToMatch: passwordValue,
                      ),
                    ),
                  ),
                  any(that: isA<AsyncLoading<PasswordResetSecondStepState>>()),
                ),
            () => listener.call(
                  any(that: isA<AsyncLoading<PasswordResetSecondStepState>>()),
                  any(that: isA<AsyncError<PasswordResetSecondStepState>>()),
                ),
          ]);

          verify(
            () => authRepository.setNewPassword(
              newPassword: passwordValue,
            ),
          ).called(1);
        },
      );
    });

    group('abortPasswordReset', () {
      test(
        'does nothing, if current authStatus is not AuthStatus.passwordReset',
        () async {
          final authRepository = MockAuthRepository();

          final authChangesStream =
              Stream.fromIterable([AuthStatus.unauthenticated]);

          final container = makeProviderContainer(
            authRepository: authRepository,
            authChangesStream: authChangesStream,
          );

          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();

          container
            ..listen(
              passwordResetSecondStepControllerProvider,
              listener.call,
              fireImmediately: true,
            )
            ..listen(authChangesProvider, (_, __) {});

          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier);

          // this delay ensures that controller reads active authChangesProvider
          await Future<void>.delayed(Duration.zero);
          await controller.abortPasswordReset();

          verifyInOrder(
            [
              () => listener.call(
                    null,
                    const AsyncData<PasswordResetSecondStepState>(
                      PasswordResetSecondStepState(),
                    ),
                  ),
            ],
          );

          verifyNever(authRepository.signOut);
        },
      );

      test(
        ''' if status is PasswordReset, then invokes AuthRepository.signOut''',
        () async {
          final authRepository = MockAuthRepository();
          final authChangesStream = Stream.value(AuthStatus.passwordReset);

          when(authRepository.signOut).thenAnswer((_) => Future.value());
          final container = makeProviderContainer(
            authRepository: authRepository,
            authChangesStream: authChangesStream,
          );

          final listener = Listener<AsyncValue<PasswordResetSecondStepState>>();

          container
            ..listen(
              passwordResetSecondStepControllerProvider,
              listener.call,
              fireImmediately: true,
            )
            ..listen(authChangesProvider, (_, __) {});

          // this delay ensures that controller reads active authChangesProvider
          await Future<void>.delayed(Duration.zero);
          final controller = container
              .read(passwordResetSecondStepControllerProvider.notifier);

          await controller.abortPasswordReset();

          verify(authRepository.signOut).called(1);
        },
      );
    });
  });
}
