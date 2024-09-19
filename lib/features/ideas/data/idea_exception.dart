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
