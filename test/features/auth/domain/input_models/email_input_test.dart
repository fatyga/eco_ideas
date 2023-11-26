import 'package:eco_ideas/features/auth/auth.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  EmailInput createSubject({String? value}) {
    if (value != null) return EmailInput.dirty(value: value);
    return const EmailInput.pure();
  }

  group('constructor', () {
    test('works properly', () => expect(createSubject, returnsNormally));
    test('EmailInput.pure() returns pure EmailInput', () {
      final emailInput = createSubject();
      expect(emailInput.isPure, equals(true));
    });
    test('EmailInput.dirty() returns dirty EmailInput', () {
      final emailInput = createSubject(value: 'example');
      expect(emailInput.isPure, equals(false));
      ;
    });
  });

  group('validator', () {
    test('returns EmailInputError.empty when value is empty', () {
      expect(createSubject().validator(''), equals(EmailInputError.empty));
    });

    test('returns EmailInputError.invalid when email is not correct', () {
      expect(
        createSubject().validator('invalid_email'),
        equals(EmailInputError.invalid),
      );
    });

    test('returns null when email is correct', () {
      expect(
        createSubject().validator('correct.email@gmail.com'),
        isNull,
      );
    });
  });
}
