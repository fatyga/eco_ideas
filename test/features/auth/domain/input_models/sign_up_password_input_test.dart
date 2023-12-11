import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignUpPasswordInput', () {
    group('constructor', () {
      test('SignUpPasswordInput.pure() returns pure SignUpPasswordInput', () {
        const input = SignUpPasswordInput.pure();
        expect(input.isPure, equals(true));
      });
      test('SignUpPasswordInput.dirty() returns dirty SignUpPasswordInput', () {
        const input = SignUpPasswordInput.dirty();
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test('returns SignUpPasswordInputError.empty when value is empty', () {
        const input = SignUpPasswordInput.dirty();
        expect(input.validator(''), equals(SignUpPasswordInputError.empty));
      });

      test('''
returns SignUpPasswordInputError.tooShort when the length of the password
         is less than 6 characters''', () {
        const input = SignUpPasswordInput.dirty();
        expect(
          input.validator('zaq1'),
          equals(SignUpPasswordInputError.tooShort),
        );
      });

      test('''
returns SignUpPasswordInputError.specialCharacterNotPresent special character is not included''',
          () {
        const input = SignUpPasswordInput.dirty();
        expect(
          input.validator('qwerty123'),
          equals(SignUpPasswordInputError.specialCharacterNotPresent),
        );
      });

      test('''
returns SignUpPasswordInputError.digitNotPresent when digit is not included''',
          () {
        const input = SignUpPasswordInput.dirty();
        expect(
          input.validator('qwerty!'),
          equals(SignUpPasswordInputError.digitNotPresent),
        );
      });

      test('''
returns SignUpPasswordInputError.uppercaseNotPresent when uppercase character is not included''',
          () {
        const input = SignUpPasswordInput.dirty();
        expect(
          input.validator('qwerty!1'),
          equals(SignUpPasswordInputError.uppercaseNotPresent),
        );
      });

      test('returns null when password is correct', () {
        const input = SignUpPasswordInput.dirty();
        expect(
          input.validator('Qwerty!1'),
          isNull,
        );
      });
    });
  });
}
