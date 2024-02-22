class EIException implements Exception {
  const EIException({required this.message});
  final String message;

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
