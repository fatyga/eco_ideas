import 'package:formz/formz.dart';

enum AboutMeInputError { tooLong }

class AboutMeInput extends FormzInput<String, AboutMeInputError> {
  const AboutMeInput.pure() : super.pure('');

  const AboutMeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  AboutMeInputError? validator(String value) {
    return null;
  }
}
