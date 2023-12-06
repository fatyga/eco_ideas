import 'package:eco_ideas/l10n/l10n.dart';
import 'package:formz/formz.dart';

enum PasswordRetypeInputError {
  mismatch;

  String errorText(AppLocalizations l10n) {
    return switch (this) {
      PasswordRetypeInputError.mismatch =>
        l10n.signUpPasswordRetypeInputMismatchErrorText
    };
  }
}

class PasswordRetypeInput extends FormzInput<String, PasswordRetypeInputError> {
  const PasswordRetypeInput.pure(this.passwordToMatch) : super.pure('');
  const PasswordRetypeInput.dirty({String value = '', this.passwordToMatch})
      : super.dirty(value);

  final String? passwordToMatch;

  @override
  PasswordRetypeInputError? validator(String value) {
    if (passwordToMatch != null) {
      if (passwordToMatch != value) return PasswordRetypeInputError.mismatch;
    }
    return null;
  }
}
