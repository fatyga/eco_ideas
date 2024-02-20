class EIException implements Exception {
  const EIException({required this.message, this.messageForUser});
  final String message;
  final String? messageForUser;

  @override
  String toString() =>
      'EIException(message: $message), messageForUser: $messageForUser';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EIException &&
        other.message == message &&
        other.messageForUser == messageForUser;
  }

  @override
  int get hashCode => message.hashCode ^ messageForUser.hashCode;
}
