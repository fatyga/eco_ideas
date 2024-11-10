import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class IdeaException implements EIException {
  IdeaException(this.message);
  @override
  final String message;
}

class CreateIdeaException extends IdeaException {
  CreateIdeaException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'temporary value';
  }
}

class IdeaWasNotFound extends IdeaException {
  IdeaWasNotFound(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Idea was not found';
  }
}

class GetUserIdeasException extends IdeaException {
  GetUserIdeasException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Could not fetch your ideas';
  }
}

class GetIdeaStepAddonsException extends IdeaException {
  GetIdeaStepAddonsException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Fail to get a step.';
  }
}

class UpdateIdeaStepException extends IdeaException {
  UpdateIdeaStepException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Fail to update step.';
  }
}

class UploadStepImageException extends IdeaException {
  UploadStepImageException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Fail to upload an image';
  }
}

class DeleteIdeaStepImageException extends IdeaException {
  DeleteIdeaStepImageException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Fail to delte an image';
  }
}

class UpdateIdeaStepAddonException extends IdeaException {
  UpdateIdeaStepAddonException(super.message);

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'Fail to update addon';
  }
}
