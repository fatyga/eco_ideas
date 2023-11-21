import 'package:formz/formz.dart';

enum UsernameInputError { empty, tooShort }

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty({String value = ''}) : super.dirty(value);

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.tooShort;
    return null;
  }
}
