import 'package:eco_ideas/l10n/l10n.dart';
import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailInputError {
  empty,
  invalid;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      EmailInputError.empty => l10n.emailInputEmptyErrorText,
      EmailInputError.invalid => l10n.emailInputInvalidErrorText,
    };
  }
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    if (!EmailValidator.validate(value)) return EmailInputError.invalid;
    return null;
  }
}
