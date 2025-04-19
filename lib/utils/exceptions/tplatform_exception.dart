class TPlatformException {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'platform-error':
        return 'A platform-specific error occurred.';
      default:
        return 'An unknown platform error occurred.';
    }
  }
}
