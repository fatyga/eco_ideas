import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/sign_up/sign_up_controller/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockUsernameInput extends Mock implements UsernameInput {}

class MockEmailInput extends Mock implements EmailInput {}

class MockSignUpPasswordInput extends Mock implements SignUpPasswordInput {}

class MockPasswordRetypeInput extends Mock implements PasswordRetypeInput {}

void main() {
  SignUpState createSubject({
    UsernameInput usernameInput = const UsernameInput.pure(),
    EmailInput emailInput = const EmailInput.pure(),
    SignUpPasswordInput passwordInput = const SignUpPasswordInput.pure(),
    PasswordRetypeInput passwordRetypeInput = const PasswordRetypeInput.pure(),
  }) {
    return SignUpState(
      usernameInput: usernameInput,
      emailInput: emailInput,
      passwordInput: passwordInput,
      passwordRetypeInput: passwordRetypeInput,
    );
  }

  group('SignUpState', () {
    group('constructor', () {
      test('works correctly', () => expect(createSubject, returnsNormally));
      test('support value equality', () {
        expect(createSubject(), equals(createSubject()));
      });
    });

    group('copyWith', () {
      test('returns the same if no arugments are provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });

      test('replaces every provided argument', () {
        const username = UsernameInput.dirty(value: 'johnDoe123');
        const email = EmailInput.dirty(value: 'john.doe@gmail.com');
        const password = SignUpPasswordInput.dirty(value: 'qwerty123');
        const passwordRetype = PasswordRetypeInput.dirty(value: 'qwerty123');

        final actual = createSubject().copyWith(
          usernameInput: username,
          emailInput: email,
          passwordInput: password,
          passwordRetypeInput: passwordRetype,
        );
        expect(
          actual,
          createSubject(
            usernameInput: username,
            emailInput: email,
            passwordInput: password,
            passwordRetypeInput: passwordRetype,
          ),
        );
      });
    });

    group('isValid', () {
      test('default value is false', () {
        expect(createSubject().isValid, equals(false));
      });

      test('equals false when at least one of inputs is invalid', () {
        final invalidUsername = MockUsernameInput();

        when(() => invalidUsername.isValid).thenReturn(false);

        expect(
          createSubject(usernameInput: invalidUsername).isValid,
          equals(false),
        );
      });

      test('equals false when all inputs are invalid', () {
        final username = MockUsernameInput();
        final email = MockEmailInput();
        final password = MockSignUpPasswordInput();
        final passwordRetype = MockPasswordRetypeInput();

        when(() => username.isValid).thenReturn(false);
        when(() => email.isValid).thenReturn(false);
        when(() => password.isValid).thenReturn(false);
        when(() => passwordRetype.isValid).thenReturn(false);
        expect(
          createSubject(
            usernameInput: username,
            emailInput: email,
            passwordInput: password,
            passwordRetypeInput: passwordRetype,
          ).isValid,
          equals(false),
        );
      });

      test('equals false when all inputs are valid', () {
        final username = MockUsernameInput();
        final email = MockEmailInput();
        final password = MockSignUpPasswordInput();
        final passwordRetype = MockPasswordRetypeInput();

        when(() => username.isValid).thenReturn(true);
        when(() => email.isValid).thenReturn(true);
        when(() => password.isValid).thenReturn(true);
        when(() => passwordRetype.isValid).thenReturn(true);
        expect(
          createSubject(
            usernameInput: username,
            emailInput: email,
            passwordInput: password,
            passwordRetypeInput: passwordRetype,
          ).isValid,
          equals(true),
        );
      });
    });
  });
}
