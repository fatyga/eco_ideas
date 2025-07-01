
import 'package:eco_ideas/l10n/arb/app_localizations.dart';
import 'package:eco_ideas/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO(fatyga): handle the most-relevant exceptions
// Maps AuthException to internationalized message for user
void handleAuthException(BuildContext context, AuthException exception) {
  final String message;
  if (exception.code == 'invalid_credentials') {
    message = context.l10n.invalid_credentials;
  } else {
    message = context.l10n.unknown_exception;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

String handleUnknownException(AppLocalizations l10n, Object exception) {
  return l10n.unknown_exception;
}
