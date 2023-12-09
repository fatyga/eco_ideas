import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum SignUpPasswordInputError {
  empty,
  tooShort,
  specialCharacterNotPresent,
  uppercaseNotPresent,
  digitNotPresent;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      SignUpPasswordInputError.empty => l10n.passwordInputEmptyErrorText,
      SignUpPasswordInputError.tooShort => l10n.passwordInputTooShortErrorText,
      SignUpPasswordInputError.specialCharacterNotPresent =>
        l10n.signUpPasswordInputErrorSpecialCharacterNotPresentText,
      SignUpPasswordInputError.uppercaseNotPresent =>
        l10n.signUpPasswordInputErrorUppercaseNotPresent,
      SignUpPasswordInputError.digitNotPresent =>
        l10n.signUpPasswordInputErrorDigitNotPresent
    };
  }
}

class SignUpPasswordInput extends FormzInput<String, SignUpPasswordInputError> {
  const SignUpPasswordInput.pure() : super.pure('');

  const SignUpPasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  SignUpPasswordInputError? validator(String value) {
    if (value.isEmpty) return SignUpPasswordInputError.empty;
    if (value.length < 6) return SignUpPasswordInputError.tooShort;
    if (!value.contains(RegExp(r'[!@#$%^&*]+'))) {
      return SignUpPasswordInputError.specialCharacterNotPresent;
    }
    if (!value.contains(RegExp('[0-9]+'))) {
      return SignUpPasswordInputError.digitNotPresent;
    }

    if (!value.contains(RegExp('[A-Z]+'))) {
      return SignUpPasswordInputError.uppercaseNotPresent;
    }
    return null;
  }
}
