import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum AboutMeInputError {
  tooLong;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      AboutMeInputError.tooLong => 'Too long',
    };
  }
}

class AboutMeInput extends FormzInput<String, AboutMeInputError> {
  const AboutMeInput.pure() : super.pure('');

  const AboutMeInput.dirty({String value = ''}) : super.dirty(value);

  @override
  AboutMeInputError? validator(String value) {
    return null;
  }
}
