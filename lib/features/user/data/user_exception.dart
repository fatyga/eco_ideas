import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

sealed class EIUserException implements EIException {
  const EIUserException();
}

class GetUserProfileFail implements EIUserException {
  @override
  String get message => 'Fail to fetch current user profile';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.getUserProfileFailSnackBarText;
  }
}

class UploadAvatarFail implements EIUserException {
  @override
  String get message => 'Fail to upload avatar for current user';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.uploadAvatarFailSnackBarText;
  }
}

class UserProfileUpdateFail implements EIUserException {
  @override
  String get message => "Fail to update user's profile";

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return l10n.updateUserProfileFailSnackBarText;
  }
}
