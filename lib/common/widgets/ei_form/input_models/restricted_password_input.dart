import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum RestrictedPasswordInputError {
  empty,
  tooShort,
  specialCharacterNotPresent,
  uppercaseNotPresent,
  digitNotPresent;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      RestrictedPasswordInputError.empty => l10n.passwordInputEmptyErrorText,
      RestrictedPasswordInputError.tooShort =>
        l10n.passwordInputTooShortErrorText,
      RestrictedPasswordInputError.specialCharacterNotPresent =>
        l10n.restrictedPasswordInputErrorSpecialCharacterNotPresentText,
      RestrictedPasswordInputError.uppercaseNotPresent =>
        l10n.restrictedPasswordInputErrorUppercaseNotPresent,
      RestrictedPasswordInputError.digitNotPresent =>
        l10n.restrictedPasswordInputErrorDigitNotPresent
    };
  }
}

class RestrictedPasswordInput
    extends FormzInput<String, RestrictedPasswordInputError> {
  const RestrictedPasswordInput.pure() : super.pure('');

  const RestrictedPasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  RestrictedPasswordInputError? validator(String value) {
    if (value.isEmpty) return RestrictedPasswordInputError.empty;
    if (value.length < 6) return RestrictedPasswordInputError.tooShort;
    if (!value.contains(RegExp(r'[!@#$%^&*]+'))) {
      return RestrictedPasswordInputError.specialCharacterNotPresent;
    }
    if (!value.contains(RegExp('[0-9]+'))) {
      return RestrictedPasswordInputError.digitNotPresent;
    }

    if (!value.contains(RegExp('[A-Z]+'))) {
      return RestrictedPasswordInputError.uppercaseNotPresent;
    }
    return null;
  }
}
