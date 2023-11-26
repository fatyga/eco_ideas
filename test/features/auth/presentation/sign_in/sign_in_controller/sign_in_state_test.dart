import 'package:eco_ideas/features/auth/domain/input_models/email_input.dart';
import 'package:eco_ideas/features/auth/domain/input_models/password_input.dart';
import 'package:eco_ideas/features/auth/presentation/sign_in/sign_in_controller/sign_in_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  SignInState createSubject({
    EmailInput email = const EmailInput.pure(),
    PasswordInput password = const PasswordInput.pure(),
    bool isValid = false,
  }) {
    return SignInState(email: email, password: password, isValid: isValid);
  }

  group('constructor', () {
    test('works correctly', () => expect(createSubject, returnsNormally));

    test('support value equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    test('returns the same object if arguments are null', () {
      expect(createSubject().copyWith(), createSubject());
    });

    test('returns new object with updated values if arguments are provided',
        () {
      expect(
        createSubject().copyWith(
          email: const EmailInput.dirty(value: 'email'),
          isValid: true,
        ),
        equals(
          createSubject(
            email: const EmailInput.dirty(value: 'email'),
            isValid: true,
          ),
        ),
      );
    });
  });
}
