import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum PasswordRetypeInputError {
  empty,
  mismatch;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      PasswordRetypeInputError.empty =>
        l10n.signUpPasswordretypeInputemptyErrorText,
      PasswordRetypeInputError.mismatch =>
        l10n.signUpPasswordRetypeInputMismatchErrorText
    };
  }
}

class PasswordRetypeInput extends FormzInput<String, PasswordRetypeInputError> {
  const PasswordRetypeInput.pure({String value = '', this.passwordToMatch})
      : super.pure(value);
  const PasswordRetypeInput.dirty({String value = '', this.passwordToMatch})
      : super.dirty(value);

  final String? passwordToMatch;

  @override
  PasswordRetypeInputError? validator(String value) {
    if (value.isEmpty) return PasswordRetypeInputError.empty;
    if (passwordToMatch == null) return PasswordRetypeInputError.mismatch;
    if (passwordToMatch != null) {
      if (passwordToMatch != value) return PasswordRetypeInputError.mismatch;
    }
    return null;
  }

  @override
  String toString() {
    return '''${super.toString().substring(0, super.toString().length - 1)} ,passwordToMatch: $passwordToMatch)''';
  }
}
