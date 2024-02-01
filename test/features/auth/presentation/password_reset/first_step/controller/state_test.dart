import 'package:eco_ideas/features/auth/auth.dart';
import 'package:eco_ideas/features/auth/presentation/password_reset/second_step/controller/state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockRestrictedPasswordInput extends Mock
    implements RestrictedPasswordInput {}

class MockPasswordRetypeInput extends Mock implements PasswordRetypeInput {}

void main() {
  PasswordResetSecondStepState createSubject({
    RestrictedPasswordInput passwordInput =
        const RestrictedPasswordInput.pure(),
    PasswordRetypeInput passwordRetypeInput = const PasswordRetypeInput.pure(),
  }) {
    return PasswordResetSecondStepState(
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
        const password = RestrictedPasswordInput.dirty(value: 'qwerty123');
        const passwordRetype = PasswordRetypeInput.dirty(value: 'qwerty123');

        final actual = createSubject().copyWith(
          passwordInput: password,
          passwordRetypeInput: passwordRetype,
        );
        expect(
          actual,
          createSubject(
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
        final passwordInput = MockRestrictedPasswordInput();

        when(() => passwordInput.isValid).thenReturn(false);

        expect(
          createSubject(passwordInput: passwordInput).isValid,
          equals(false),
        );
      });

      test('equals false when all inputs are invalid', () {
        final passwordInput = MockRestrictedPasswordInput();
        final passwordRetypeInput = MockPasswordRetypeInput();

        when(() => passwordInput.isValid).thenReturn(false);
        when(() => passwordRetypeInput.isValid).thenReturn(false);
        expect(
          createSubject(
            passwordInput: passwordInput,
            passwordRetypeInput: passwordRetypeInput,
          ).isValid,
          equals(false),
        );
      });

      test('equals true when all inputs are valid', () {
        final passwordInput = MockRestrictedPasswordInput();
        final passwordRetypeInput = MockPasswordRetypeInput();

        when(() => passwordInput.isValid).thenReturn(true);
        when(() => passwordRetypeInput.isValid).thenReturn(true);
        expect(
          createSubject(
            passwordInput: passwordInput,
            passwordRetypeInput: passwordRetypeInput,
          ).isValid,
          equals(true),
        );
      });
    });
  });
}
