import 'package:eco_ideas/features/auth/data/auth_repository/auth_failure/auth_failure.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

extension AuthFailureUI on AuthFailure {
  String resloveErrorMessageForUser(BuildContext context) {
    final l10n = context.l10n;

    if (this is BadEmailOrPassword) {
      return l10n.badEmailOrPasswordFailureSnackBarText;
    } //TODO(fatyga): implement messages for the rest of errors

    return 'unimplemented error';
  }
}
