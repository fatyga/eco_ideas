import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PasswordInput', () {
    group('constructor', () {
      test('PasswordInput.pure() returns pure PasswordInput', () {
        const input = PasswordRetypeInput.pure();
        expect(input.isPure, equals(true));
      });
      test('PasswordInput.dirty() returns dirty PasswordInput', () {
        const input = PasswordRetypeInput.dirty();
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test('returns PasswordInputError.empty when value is empty', () {
        const input = PasswordRetypeInput.dirty();
        expect(input.validator(''), equals(PasswordInputError.empty));
      });

      test('''
returns PasswordInputError.tooShort when the length of the password
         is less than 6 characters''', () {
        const input = PasswordRetypeInput.dirty();
        expect(
          input.validator('zaq1'),
          equals(PasswordInputError.tooShort),
        );
      });

      test('returns null when password is correct', () {
        const input = PasswordRetypeInput.dirty();
        expect(
          input.validator('zaq1234'),
          isNull,
        );
      });
    });
  });
}
