import 'package:get/get.dart';
import 'package:grocify/features/shop/models/cart_item_model.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/local_storage/storage_utility.dart';
import 'package:grocify/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();


  CartController() {
    loadCartItems();
  }

  // Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;


  //final variationController = VariationController.instance;

  // Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Variation Selected?
    if (product.productType == ProductType.variable.toString()) {
      /*&& variationController.selectedVariation.value.id.isEmpty) */
      TLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out of Stock Status
    // Out of Stock Status (for non-variable products only)
    if (product.stock < 1) {
      TLoaders.warningSnackBar(
        message: 'This product is out of stock.',
        title: 'Oh Snap!',
      );
      return;
    }

    // Convert Product Model to a CartModel with the given quantity
    final selectedCartItem = convertToCartItem(
        product, productQuantityInCart.value);
    // check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId);

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }


    updateCart();
    TLoaders.customToast(message: 'Your Product has been added to the cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == item.productId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }




  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((carItem) =>
    carItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before completely removing
        cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems
            .removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
    middleText: 'Are you sure you want to remove this product?',
    onConfirm: () {
    // Remove the item from the cart
    cartItems.removeAt(index);
    updateCart();
    TLoaders.customToast(message: 'Product removed from the Cart.');
    Get.back();
    },
    onCancel: () => () => Get.back(),
    );
  }





  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      image: product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
    );
  }


  void updateCart(){
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }


  void updateCartTotals() {
    double calculateOfTotalPrice = 0.0;
    int calculateONoOfItems = 0;

    for (var item in cartItems) {
      calculateOfTotalPrice += (item.price) * item.quantity.toDouble();
      calculateONoOfItems += item.quantity;
    }

    totalCartPrice.value = calculateOfTotalPrice;
    noOfCartItems.value = calculateONoOfItems;
  }

  void saveCartItems(){
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems(){
    final cartItemStrings = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(cartItemStrings != null){
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCant(String productId) {
    final foundItem =
    cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }


  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

}




