import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/formatters/formatter.dart';
import 'package:intl/intl.dart';

void main() {
  group('TFormatter', () {
    test('formatDate should format date as dd-MMM-yyyy', () {
      final date = DateTime(2024, 4, 22);
      final formatted = TFormatter.formatDate(date);
      expect(formatted, '22-Apr-2024');
    });

    test('formatDate should use current date if null', () {
      final result = TFormatter.formatDate(null);
      final today = DateFormat('dd-MMM-yyyy').format(DateTime.now());
      expect(result, today);
    });

    test('formatCurrency should return formatted currency string', () {
      final formatted = TFormatter.formatCurrency(1234.56);
      expect(formatted, '\$1,234.56');
    });

    test('formatPhoneNumber with 10 digits', () {
      final formatted = TFormatter.formatPhoneNumber('1234567890');
      expect(formatted, '(123) 456 7890');
    });

    test('formatPhoneNumber with 11 digits', () {
      final formatted = TFormatter.formatPhoneNumber('01234567890');
      expect(formatted, '(0123) 456 7890');
    });

    test('formatPhoneNumber with invalid input length', () {
      final formatted = TFormatter.formatPhoneNumber('12345');
      expect(formatted, '12345');
    });


    test('internationalFormatPhoneNumber handles non-digit characters', () {
      final formatted =
          TFormatter.internationalFormatPhoneNumber('+12 (345) 678-9012');
      expect(formatted, '(+12) 34 56 78 90 12');
    });
  });
}
