import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/password_input.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEmailInput extends Mock implements EmailInput {}

class MockPasswordInput extends Mock implements PasswordInput {}

void main() {
  group('SignInState', () {
    SignInState createSubject({
      EmailInput email = const EmailInput.pure(),
      PasswordInput password = const PasswordInput.pure(),
    }) {
      return SignInState(
        email: email,
        password: password,
      );
    }

    group('constructor', () {
      test('works correctly', () => expect(createSubject, returnsNormally));

      test('support value equality', () {
        expect(createSubject(), equals(createSubject()));
      });
    });

    group('copyWith', () {
      test('returns the same object no arguments are provided', () {
        expect(createSubject().copyWith(), createSubject());
      });

      test('replaces every provided argument', () {
        expect(
          createSubject().copyWith(
            email: const EmailInput.dirty(value: 'email'),
          ),
          equals(
            createSubject(
              email: const EmailInput.dirty(value: 'email'),
            ),
          ),
        );
      });
    });

    group('isValid', () {
      test('default value is false', () {
        expect(createSubject().isValid, equals(false));
      });

      test('equals false when both of inputs are invalid', () {
        final emailInput = MockEmailInput();
        final passwordInput = MockPasswordInput();

        when(() => emailInput.isValid).thenReturn(false);
        when(() => passwordInput.isValid).thenReturn(false);

        expect(
          createSubject(email: emailInput, password: passwordInput).isValid,
          equals(false),
        );
      });

      test('equals false when one of inputs is invalid', () {
        final emailInput = MockEmailInput();
        final passwordInput = MockPasswordInput();

        when(() => emailInput.isValid).thenReturn(false);
        when(() => passwordInput.isValid).thenReturn(true);

        expect(
          createSubject(email: emailInput, password: passwordInput).isValid,
          equals(false),
        );
      });

      test('equals true when both of inputs are valid', () {
        final emailInput = MockEmailInput();
        final passwordInput = MockPasswordInput();

        when(() => emailInput.isValid).thenReturn(true);
        when(() => passwordInput.isValid).thenReturn(true);

        expect(
          createSubject(email: emailInput, password: passwordInput).isValid,
          equals(true),
        );
      });
    });
  });
}
