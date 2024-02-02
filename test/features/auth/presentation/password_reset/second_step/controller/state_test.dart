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

  group('PasswordResetSecondStepState', () {
    group('constructor', () {
      test('works correctly', () => expect(createSubject, returnsNormally));
      test(
        'support value equality',
        () => expect(createSubject(), equals(createSubject())),
      );
    });

    group('copyWith', () {
      test(
        'returns the same object if no arugments are provided',
        () => expect(createSubject().copyWith(), equals(createSubject())),
      );

      test('replace every provided argument', () {
        const passwordInput = RestrictedPasswordInput.dirty(value: 'Qwerty!1');
        const passwordRetypeInput =
            PasswordRetypeInput.dirty(value: 'Qwerty!1');

        final actual = createSubject().copyWith(
          passwordInput: passwordInput,
          passwordRetypeInput: passwordRetypeInput,
        );
        expect(
          actual,
          equals(
            createSubject(
              passwordInput: passwordInput,
              passwordRetypeInput: passwordRetypeInput,
            ),
          ),
        );
      });
    });

    group('isValid', () {
      test(
        'default value is false',
        () => expect(createSubject().isValid, equals(false)),
      );

      test('equals false when at least one of inputs is invalid', () {
        final passwordInput = MockRestrictedPasswordInput();

        when(() => passwordInput.isValid).thenReturn(false);

        expect(
          createSubject(passwordInput: passwordInput).isValid,
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
