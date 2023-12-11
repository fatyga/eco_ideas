import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailInput', () {
    group('constructor', () {
      test('EmailInput.pure() returns pure EmailInput', () {
        const input = EmailInput.pure();
        expect(input.isPure, equals(true));
      });
      test('EmailInput.dirty() returns dirty EmailInput', () {
        const input = EmailInput.dirty(value: 'example');
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test('returns EmailInputError.empty when value is empty', () {
        const input = EmailInput.dirty();
        expect(input.validator(''), equals(EmailInputError.empty));
      });

      test('returns EmailInputError.invalid when email is not correct', () {
        const input = EmailInput.dirty();
        expect(
          input.validator('invalid_email'),
          equals(EmailInputError.invalid),
        );
      });

      test('returns null when email is correct', () {
        const input = EmailInput.dirty();

        expect(
          input.validator('correct.email@gmail.com'),
          isNull,
        );
      });
    });
  });
}
