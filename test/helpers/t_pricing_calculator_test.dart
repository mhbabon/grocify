import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/helpers/pricing_caculator.dart';


void main() {
  group('TPricingCalculator', () {
    const double productPrice = 100.0;
    const String location = 'Dhaka';

    test('calculateTotalPrice returns correct total', () {
      final result = TPricingCalculator.calculateTotalPrice(productPrice, location);
      final expectedTax = productPrice * 0.10; // 10% tax
      final expectedShipping = 50.00;
      final expectedTotal = productPrice + expectedTax + expectedShipping;

      expect(result, expectedTotal);
    });

    test('calculateShippingCost returns formatted shipping cost', () {
      final result = TPricingCalculator.calculateShippingCost(productPrice, location);
      expect(result, '50.00');
    });

    test('calculateTax returns formatted tax amount', () {
      final result = TPricingCalculator.calculateTax(productPrice, location);
      final expectedTax = (productPrice * 0.10).toStringAsFixed(2);
      expect(result, expectedTax);
    });

    test('getTaxRateForLocation returns fixed tax rate', () {
      final result = TPricingCalculator.getTaxRateForLocation(location);
      expect(result, 0.10);
    });

    test('getShippingCost returns fixed shipping cost', () {
      final result = TPricingCalculator.getShippingCost(location);
      expect(result, 50.00);
    });
  });
}
