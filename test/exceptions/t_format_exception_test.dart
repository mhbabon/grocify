import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/exceptions/format_exceptions.dart';


void main() {
  group('TFormatException', () {
    test('default constructor returns default message', () {
      const exception = TFormatException();
      expect(exception.message, 'An unexpected format error occurred. Please check your input.');
    });

    test('fromMessage constructor returns custom message', () {
      final exception = TFormatException.fromMessage('Custom format error');
      expect(exception.message, 'Custom format error');
    });

    test('formattedMessage returns the same as message', () {
      const exception = TFormatException('Test error');
      expect(exception.formattedMessage, exception.message);
    });

    final codeTestCases = <String, String>{
      'invalid-email-format': 'The email address format is invalid. Please enter a valid email.',
      'invalid-phone-number-format': 'The provided phone number format is invalid. Please enter a valid number.',
      'invalid-date-format': 'The date format is invalid. Please enter a valid date.',
      'invalid-url-format': 'The URL format is invalid. Please enter a valid URL.',
      'invalid-credit-card-format': 'The credit card format is invalid. Please enter a valid credit card number.',
      'invalid-numeric-format': 'The input should be a valid numeric format.',
    };

    test('fromCode returns correct message for known codes', () {
      for (final entry in codeTestCases.entries) {
        final exception = TFormatException.fromCode(entry.key);
        expect(exception.message, entry.value, reason: 'Failed on code: ${entry.key}');
      }
    });

    test('fromCode returns default message for unknown code', () {
      final exception = TFormatException.fromCode('unknown-code');
      expect(exception.message, 'An unexpected format error occurred. Please check your input.');
    });
  });
}
