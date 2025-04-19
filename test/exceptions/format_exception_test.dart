import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/exceptions/tformat_exception.dart';


void main() {
  group('TFormatException', () {
    test('returns default message when no message is provided', () {
      final exception = TFormatException();
      expect(exception.toString(), 'Invalid format. Please try again.');
    });

    test('returns custom message when provided', () {
      final exception = TFormatException('Custom error');
      expect(exception.toString(), 'Custom error');
    });
  });
}
