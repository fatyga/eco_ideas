enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

extension AuthStatusX on AuthStatus {
  bool get isUnknown => this == AuthStatus.unknown;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;
}
