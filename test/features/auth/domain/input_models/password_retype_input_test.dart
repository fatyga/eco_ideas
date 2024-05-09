import 'package:eco_ideas/common/widgets/ei_form/input_models/password_retype_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PasswordRetypeInput', () {
    group('constructor', () {
      test('PasswordRetypeInput.pure() returns pure input', () {
        const input = PasswordRetypeInput.pure();
        expect(input.isPure, equals(true));
      });

      test('PasswordRetypeInput.dirty() returns dirty input', () {
        const input = PasswordRetypeInput.dirty();
        expect(input.isPure, equals(false));
      });
    });

    group('validator', () {
      test('returns PasswordRetypeInputError.empty when value is empty', () {
        const input = PasswordRetypeInput.dirty();
        expect(input.validator(''), equals(PasswordRetypeInputError.empty));
      });

      test(
        '''
returns PasswordRetypeInputError.mismatch when given value does
       not match passwordToMatch value''',
        () {
          const input = PasswordRetypeInput.dirty(passwordToMatch: 'qwerty123');
          expect(
            input.validator('zaq123'),
            equals(PasswordRetypeInputError.mismatch),
          );
        },
      );

      test(
        '''returns null when given value is not empty and match passwordToMatch value''',
        () {
          const input = PasswordRetypeInput.dirty(passwordToMatch: 'qwerty123');
          expect(input.validator('qwerty123'), equals(null));
        },
      );
    });
  });
}
