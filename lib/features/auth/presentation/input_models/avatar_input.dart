import 'dart:io';

import 'package:formz/formz.dart';

enum AvatarInputError { nonExistingFile, emptyPath }

class AvatarInput extends FormzInput<String?, AvatarInputError> {
  const AvatarInput.pure() : super.pure(null);

  const AvatarInput.dirty({String? value}) : super.dirty(value);

  @override
  AvatarInputError? validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return AvatarInputError.emptyPath;
    }
    if (!File(value).existsSync()) return AvatarInputError.nonExistingFile;
    return null;
  }
}
