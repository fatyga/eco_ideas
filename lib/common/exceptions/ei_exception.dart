import 'package:eco_ideas/l10n/l10n.dart';

abstract interface class EIException implements Exception {
  const EIException({required this.message}) : super();
  final String message;
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
