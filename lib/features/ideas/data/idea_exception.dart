import 'package:eco_ideas/common/exceptions/ei_exception.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class IdeaException implements EIException {}

class CreateIdeaException extends IdeaException {
  @override
  String get message => 'Fail to create new idea';

  @override
  String resolveMessageForUser(AppLocalizations l10n) {
    return 'temporary value';
  }
}
