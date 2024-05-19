// ignore_for_file: cascade_invocations, lines_longer_than_80_chars

import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/data/auth_repository/auth_exception/auth_exception.dart';
import 'package:eco_ideas/features/auth/data/data.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class Listener<T> extends Mock {
  void call(T? current, T next);
}

void main() {
  ProviderContainer makeProviderContainer({
    AuthRepository? authRepository,
    UserRepository? userRepository,
  }) {
    final container = ProviderContainer(
      overrides: [
        if (authRepository != null)
          authRepositoryProvider.overrideWith((_) => authRepository),
        if (userRepository != null)
          userRepositoryProvider.overrideWith((ref) => userRepository),
      ],
    );

    addTearDown(container.dispose);
    return container;
  }

  group('SignUpController', () {
    setUpAll(() {
      registerFallbackValue(const AsyncLoading<SignUpState>());
    });
    group('build', () {
      test('returns AsyncData<SignUpState> instance', () {
        final container = makeProviderContainer();

        final listener = Listener<AsyncValue<SignUpState>>();

        container.listen(
          signUpControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        verify(
          () => listener(null, const AsyncData<SignUpState>(SignUpState())),
        ).called(1);
      });
    });

    group('fields updating', () {
      group('updateEmailField', () {
        const enteredValue = 'john.doe@gmail.com';

        test('set email to EmailInput.pure() when newValue is empty', () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updateEmailField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(SignUpState()),
                ),
          ]);

          expect(controller.state.requireValue.emailInput.isPure, equals(true));
          expect(controller.state.requireValue.emailInput.value, equals(''));
          verifyNoMoreInteractions(listener);
        });

        test('''
set email to EmailInput.dirty(value: newValue) when [newValue] is provided''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updateEmailField(enteredValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
                      emailInput: EmailInput.dirty(value: enteredValue),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.emailInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.emailInput.value,
            equals(enteredValue),
          );
          verifyNoMoreInteractions(listener);
        });
      });

      group('updateUsernameField', () {
        const enteredValue = 'johnDoe123';

        // test('does nothing, if state could not be resolved', () {
        //   final container = makeProviderContainer();
        //   final listener = Listener<AsyncValue<SignUpState>>();

        //   container.listen(
        //     signUpControllerProvider,
        //     listener.call,
        //     fireImmediately: true,
        //   );

        //   final controller = container.read(signUpControllerProvider.notifier);
        //   // set state diffrent than data, with no previous data

        //   controller.state =
        //       const AsyncValue<SignUpState>.loading().unwrapPrevious();

        //   controller.updateUsernameField(enteredValue);
        //   verifyInOrder(
        //     [
        //       () => listener.call(
        //             null,
        //             const AsyncData<SignUpState>(SignUpState()),
        //           ),
        //       () => listener.call(
        //             const AsyncData<SignUpState>(SignUpState()),
        //             const AsyncLoading<SignUpState>(),
        //           ),
        //     ],
        //   );
        //   verifyNoMoreInteractions(listener);
        // });
        test('set usernameInput to UsernameInput.pure() when newValue is empty',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updateUsernameField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(SignUpState()),
                ),
          ]);

          expect(
            controller.state.requireValue.usernameInput.isPure,
            equals(true),
          );

          expect(controller.state.requireValue.usernameInput.value, equals(''));

          verifyNoMoreInteractions(listener);
        });

        test('''
set usernameInput to UsernameInput.dirty(value: newValue) when [newValue] is provided''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updateUsernameField(enteredValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
                      usernameInput: UsernameInput.dirty(value: enteredValue),
                    ),
                  ),
                ),
          ]);

          expect(
            controller.state.requireValue.usernameInput.isPure,
            equals(false),
          );

          expect(
            controller.state.requireValue.usernameInput.value,
            equals(enteredValue),
          );
          verifyNoMoreInteractions(listener);
        });
      });

      group('updatePasswordField', () {
        const validValue = 'Qwerty1!';
        const invalidValue = 'qwerty123';

        test(
            'set passwordInput to RestrictedPasswordInput.pure() when newValue is empty',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(SignUpState()),
                ),
          ]);

          expect(
            controller.state.requireValue.passwordInput.isPure,
            equals(true),
          );

          expect(controller.state.requireValue.passwordInput.value, equals(''));

          verifyNoMoreInteractions(listener);
        });

        test('''
set passwordInput to RestrictedPasswordInput.dirty(value: newValue) when [newValue] is provided''',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
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

        test(
            'if passwordInput with entered value is invalid, passwordRetypeInput stays untouched',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField(invalidValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
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
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
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
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          const passwordRetypeInputValue = 'zaq123';
          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordRetypeField(passwordRetypeInputValue)
            ..updatePasswordField(validValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordRetypeInputValue,
                      ),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordRetypeInput: PasswordRetypeInput.dirty(
                        value: passwordRetypeInputValue,
                      ),
                    ),
                  ),
                  const AsyncData<SignUpState>(
                    SignUpState(
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

      group('updatePasswordRetypeInput', () {
        const enteredValue = 'Qwerty1!';

        test(
            'set passwordRetypeInput to PasswordRetypeInput.pure() when newValue is empty and passwordInput.isValid is false',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordRetypeField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(SignUpState()),
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

        test(
            'if [newValue] is empty, and [passwordInput.isValid] is true, then [passwordToMatch] should be updated to passwordInput.value',
            () {
          final container = makeProviderContainer();
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField(enteredValue)
            ..updatePasswordRetypeField('');

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: enteredValue),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordInput:
                          RestrictedPasswordInput.dirty(value: enteredValue),
                    ),
                  ),
                  const AsyncData<SignUpState>(
                    SignUpState(
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
          final listener = Listener<AsyncValue<SignUpState>>();
          container.listen(
            signUpControllerProvider,
            listener.call,
            fireImmediately: true,
          );

          const passwordFieldValue = 'Zaq!123';
          final controller = container.read(signUpControllerProvider.notifier)
            ..updatePasswordField(passwordFieldValue)
            ..updatePasswordRetypeField(enteredValue);

          verifyInOrder([
            () => listener.call(
                  null,
                  const AsyncData<SignUpState>(SignUpState()),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(SignUpState()),
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordFieldValue,
                      ),
                    ),
                  ),
                ),
            () => listener.call(
                  const AsyncData<SignUpState>(
                    SignUpState(
                      passwordInput: RestrictedPasswordInput.dirty(
                        value: passwordFieldValue,
                      ),
                    ),
                  ),
                  const AsyncData<SignUpState>(
                    SignUpState(
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

    group('signUpWithEmail', () {
      const username = 'JohnDoe123';
      const email = 'john.doe@gmail.com';
      const password = 'Qwerty!1';

      test('does nothing, when state.isValid == false', () async {
        final authRepository = MockAuthRepository();

        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<SignUpState>>();

        container.listen(
          signUpControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signUpControllerProvider.notifier);
        await controller.signUpWithEmail();
        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignUpState>(SignUpState())),
        ]);

        verifyNever(
          () => authRepository.signUpWithEmail(
            email: email,
            password: password,
            username: username,
          ),
        );
      });

      test('sign up fail', () async {
        final authRepository = MockAuthRepository();

        when(
          () => authRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
          ),
        ).thenThrow(SignUpFail());

        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<SignUpState>>();

        container.listen(
          signUpControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signUpControllerProvider.notifier)
          ..updateUsernameField(username)
          ..updateEmailField(email)
          ..updatePasswordField(password)
          ..updatePasswordRetypeField(password);

        await controller.signUpWithEmail();

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignUpState>(SignUpState())),
          () => listener.call(
                const AsyncData<SignUpState>(
                  SignUpState(
                    usernameInput: UsernameInput.dirty(value: username),
                    emailInput: EmailInput.dirty(value: email),
                    passwordInput:
                        RestrictedPasswordInput.dirty(value: password),
                    passwordRetypeInput:
                        PasswordRetypeInput.dirty(value: password),
                  ),
                ),
                any(that: isA<AsyncLoading<SignUpState>>()),
              ),
          () => listener.call(
                any(that: isA<AsyncLoading<SignUpState>>()),
                any(that: isA<AsyncError<SignUpState>>()),
              ),
        ]);

        verify(
          () => authRepository.signUpWithEmail(
            email: email,
            password: password,
            username: username,
          ),
        ).called(1);
      });

      test('sign up success', () async {
        final authRepository = MockAuthRepository();

        when(
          () => authRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
          ),
        ).thenAnswer((_) => Future.value());
        final container = makeProviderContainer(authRepository: authRepository);
        final listener = Listener<AsyncValue<SignUpState>>();

        container.listen(
          signUpControllerProvider,
          listener.call,
          fireImmediately: true,
        );

        final controller = container.read(signUpControllerProvider.notifier)
          ..updateUsernameField(username)
          ..updateEmailField(email)
          ..updatePasswordField(password)
          ..updatePasswordRetypeField(password);

        await controller.signUpWithEmail();

        verifyInOrder([
          () =>
              listener.call(null, const AsyncData<SignUpState>(SignUpState())),
          () => listener.call(
                const AsyncData<SignUpState>(
                  SignUpState(
                    usernameInput: UsernameInput.dirty(value: username),
                    emailInput: EmailInput.dirty(value: email),
                    passwordInput:
                        RestrictedPasswordInput.dirty(value: password),
                    passwordRetypeInput:
                        PasswordRetypeInput.dirty(value: password),
                  ),
                ),
                any(that: isA<AsyncLoading<SignUpState>>()),
              ),
          () => listener.call(
                any(that: isA<AsyncLoading<SignUpState>>()),
                const AsyncData<SignUpState>(
                  SignUpState(
                    usernameInput: UsernameInput.dirty(value: username),
                    emailInput: EmailInput.dirty(value: email),
                    passwordInput:
                        RestrictedPasswordInput.dirty(value: password),
                    passwordRetypeInput:
                        PasswordRetypeInput.dirty(value: password),
                    status: SignUpStateStatus.linkSent,
                  ),
                ),
              ),
        ]);

        verify(
          () => authRepository.signUpWithEmail(
            email: email,
            password: password,
            username: username,
          ),
        ).called(1);
      });
    });
  });
}
