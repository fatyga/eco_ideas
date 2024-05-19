import 'dart:io';

import 'package:eco_ideas/features/user/presentation/user_avatar/user_avatar_controller/user_avatar.dart';
import 'package:formz/formz.dart';

enum AvatarInputError { nonExistingFile, emptyPath }

class AvatarInput extends FormzInput<UserAvatar?, AvatarInputError> {
  const AvatarInput.pure() : super.pure(null);

  const AvatarInput.dirty({UserAvatar? value}) : super.dirty(value);

  @override
  AvatarInputError? validator(UserAvatar? value) {
    if (value == null) return null;
    if (value.path.isEmpty) {
      return AvatarInputError.emptyPath;
    }

    if (value.source == UserAvatarSource.local &&
        !File(value.path).existsSync()) return AvatarInputError.nonExistingFile;
    return null;
  }
}
