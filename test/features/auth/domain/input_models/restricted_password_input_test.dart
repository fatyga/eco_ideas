import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RestrictedPasswordInput', () {
    group('constructor', () {
      test(
          '''
RestrictedPasswordInput.pure() returns pure RestrictedPasswordInput''',
          () {
        const input = RestrictedPasswordInput.pure();
        expect(input.isPure, equals(true));
      });
      test(
          '''
RestrictedPasswordInput.dirty() returns dirty RestrictedPasswordInput''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test(
          '''
returns RestrictedPasswordInputError.empty when value is empty''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(input.validator(''), equals(RestrictedPasswordInputError.empty));
      });

      test(
          '''
returns RestrictedPasswordInputError.tooShort when the length of the password
         is less than 6 characters''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(
          input.validator('zaq1'),
          equals(RestrictedPasswordInputError.tooShort),
        );
      });

      test(
          '''
returns RestrictedPasswordInputError.specialCharacterNotPresent special character is not included''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(
          input.validator('qwerty123'),
          equals(RestrictedPasswordInputError.specialCharacterNotPresent),
        );
      });

      test(
          '''
returns RestrictedPasswordInputError.digitNotPresent when digit is not included''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(
          input.validator('qwerty!'),
          equals(RestrictedPasswordInputError.digitNotPresent),
        );
      });

      test(
          '''
returns RestrictedPasswordInputError.uppercaseNotPresent when uppercase character is not included''',
          () {
        const input = RestrictedPasswordInput.dirty();
        expect(
          input.validator('qwerty!1'),
          equals(RestrictedPasswordInputError.uppercaseNotPresent),
        );
      });

      test('returns null when password is correct', () {
        const input = RestrictedPasswordInput.dirty();
        expect(
          input.validator('Qwerty!1'),
          isNull,
        );
      });
    });
  });
}
