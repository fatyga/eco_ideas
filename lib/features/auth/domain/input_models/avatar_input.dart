import 'package:formz/formz.dart';

enum AvatarInputError { nonExistingFile }

class AvatarInput extends FormzInput<String?, AvatarInputError> {
  const AvatarInput.pure() : super.pure('');

  const AvatarInput.dirty({String value = ''}) : super.dirty(value);

  @override
  AvatarInputError? validator(String? newValue) {
    return null;
  }
}
