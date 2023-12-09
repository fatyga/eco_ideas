import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum UsernameInputError {
  empty,
  tooShort;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      UsernameInputError.empty => l10n.signUpUsernameInputErrorEmptyText,
      UsernameInputError.tooShort => l10n.signUpUsernameInputErrorTooShortText
    };
  }
}

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
