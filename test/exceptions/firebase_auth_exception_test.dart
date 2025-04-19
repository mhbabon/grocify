import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/exceptions/tfirebase_auth_exception.dart';


void main() {
  group('TFirebaseAuthException', () {
    test('returns correct message for known codes', () {
      expect(TFirebaseAuthException('email-already-in-use').message,
          'This email is already in use. Please try logging in.');

      expect(TFirebaseAuthException('invalid-email').message,
          'The email address is not valid.');

      expect(TFirebaseAuthException('operation-not-allowed').message,
          'Email/password accounts are not enabled.');

      expect(TFirebaseAuthException('weak-password').message,
          'The password provided is too weak.');
    });

    test('returns default message for unknown code', () {
      expect(TFirebaseAuthException('some-unknown-code').message,
          'An unknown authentication error occurred.');
    });
  });
}
