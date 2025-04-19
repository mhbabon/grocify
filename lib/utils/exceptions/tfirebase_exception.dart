class TFirebaseException {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return 'You do not have permission to perform this operation.';
      case 'unavailable':
        return 'Firebase service is temporarily unavailable.';
      default:
        return 'A Firebase error occurred.';
    }
  }
}
