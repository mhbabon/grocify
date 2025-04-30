import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:mockito/mockito.dart';
import 'package:grocify/features/shop/controllers/favourite_controller.dart';

import '../../../../../mocks/favourites_controller_mock.mocks.dart';


void main() {
  late MockFavouritesController mockController;

  setUp(() {
    mockController = MockFavouritesController();
  });

  test('favouriteProducts returns list of favourite products', () async {
    // Arrange
    final mockProducts = [
      ProductModel(id: '1', title: 'Test Product 1', price: 100, stock: 1, thumbnail: '', productType: '', quantity: ''),
      ProductModel(id: '2', title: 'Test Product 2', price: 200, stock: 1, thumbnail: '', productType: '', quantity: ''),
    ];

    when(mockController.favouriteProducts()).thenAnswer((_) async => mockProducts);

    // Act
    final products = await mockController.favouriteProducts();

    // Assert
    expect(products.length, 2);
    expect(products[0].title, 'Test Product 1');
  });
}
