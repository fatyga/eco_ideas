import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum PasswordInputError {
  empty,
  tooShort;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      PasswordInputError.empty => l10n.passwordInputEmptyErrorText,
      PasswordInputError.tooShort => l10n.passwordInputTooShortErrorText,
    };
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.tooShort;
    return null;
  }
}
