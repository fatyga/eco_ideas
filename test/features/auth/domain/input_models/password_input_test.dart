import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  PasswordInput createSubject({String? value}) {
    if (value != null) return PasswordInput.dirty(value: value);
    return const PasswordInput.pure();
  }

  group('constructor', () {
    test('works properly', () => expect(createSubject, returnsNormally));
    test('PasswordInput.pure() returns pure PasswordInput', () {
      final passwordInput = createSubject();
      expect(passwordInput.isPure, equals(true));
    });
    test('PasswordInput.dirty() returns dirty PasswordInput', () {
      final emailInput = createSubject(value: 'example');
      expect(emailInput.isPure, equals(false));
    });
  });

  group('validator', () {
    test('returns PasswordInputError.empty when value is empty', () {
      expect(createSubject().validator(''), equals(PasswordInputError.empty));
    });

    test(
        '''
returns PasswordInputError.tooShort when the length of the password
         is less than 6 characters''',
        () {
      expect(
        createSubject().validator('two'),
        equals(PasswordInputError.tooShort),
      );
    });

    test('returns null when password is correct', () {
      expect(
        createSubject().validator('correctPassword1'),
        isNull,
      );
    });
  });
}
