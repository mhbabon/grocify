/// Custom exception class to handle Firebase-related errors.
class TFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message => _firebaseErrorMessages[code] ?? _defaultErrorMessage;

  /// Standardized Firebase error messages.
  static const Map<String, String> _firebaseErrorMessages = {
    'unknown': 'An unknown Firebase error occurred. Please try again.',
    'invalid-custom-token': 'The custom token format is incorrect.',
    'custom-token-mismatch': 'The custom token corresponds to a different audience.',
    'user-disabled': 'The user account has been disabled.',
    'user-not-found': 'No user found for the given email or UID.',
    'invalid-email': 'The email address provided is invalid.',
    'email-already-in-use': 'The email address is already registered.',
    'wrong-password': 'Incorrect password. Please check your password.',
    'weak-password': 'The password is too weak.',
    'provider-already-linked': 'The account is already linked with another provider.',
    'operation-not-allowed': 'This operation is not allowed.',
    'invalid-credential': 'The supplied credential is malformed or has expired.',
    'invalid-verification-code': 'Invalid verification code.',
    'invalid-verification-id': 'Invalid verification ID.',
    'captcha-check-failed': 'The reCAPTCHA response is invalid.',
    'app-not-authorized': 'The app is not authorized for Firebase Authentication.',
    'internal-error': 'An internal authentication error occurred.',
    'user-mismatch': 'The supplied credentials do not match the signed-in user.',
    'requires-recent-login': 'This operation requires recent authentication.',
    'quota-exceeded': 'Quota exceeded, please try again later.',
    'account-exists-with-different-credential': 'An account exists with a different sign-in method.',
    'invalid-action-code': 'The action code is invalid or expired.',
    'credential-already-in-use': 'This credential is already associated with another account.',
  };

  /// Default error message for unknown errors.
  static const String _defaultErrorMessage =
      'An unexpected Firebase error occurred. Please try again.';

  /// Factory constructor to handle error codes dynamically.
  factory TFirebaseException.fromCode(String errorCode) {
    return TFirebaseException(errorCode);
  }
}