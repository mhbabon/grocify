import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/exceptions/tfirebase_exception.dart';


void main() {
  group('TFirebaseException', () {
    test('returns correct message for known codes', () {
      expect(
        TFirebaseException('permission-denied').message,
        'You do not have permission to perform this operation.',
      );

      expect(
        TFirebaseException('unavailable').message,
        'Firebase service is temporarily unavailable.',
      );
    });

    test('returns default message for unknown codes', () {
      expect(
        TFirebaseException('some-unknown-code').message,
        'A Firebase error occurred.',
      );
    });
  });
}
