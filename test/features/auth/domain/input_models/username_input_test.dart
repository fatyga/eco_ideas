import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsernameInput', () {
    group('constructor', () {
      test('UsernameInput.pure() returns pure UsernameInput', () {
        const input = UsernameInput.pure();
        expect(input.isPure, equals(true));
      });
      test('UsernameInput.dirty() returns dirty UsernameInput', () {
        const input = UsernameInput.dirty(value: 'johndoe123');
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test('returns UsernameInputError.empty when value is empty', () {
        const input = UsernameInput.dirty();
        expect(input.validator(''), equals(UsernameInputError.empty));
      });

      test(
          '''returns UsernameInputError.tooShort when the length of value is less than 6''',
          () {
        const input = UsernameInput.dirty();

        expect(
          input.validator('john'),
          equals(UsernameInputError.tooShort),
        );
      });

      test('returns null when email is correct', () {
        const input = UsernameInput.dirty();
        expect(
          input.validator('johnDoe123'),
          isNull,
        );
      });
    });
  });
}
