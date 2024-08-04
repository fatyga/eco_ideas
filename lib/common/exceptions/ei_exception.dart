import 'package:eco_ideas/l10n/l10n.dart';

abstract class EIException implements Exception {
  String get message;
  String resolveMessageForUser(AppLocalizations l10n);

  @override
  String toString() => 'EIException(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EIException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
