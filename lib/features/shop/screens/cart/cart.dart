import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:grocify/features/shop/screens/checkout/checkout.dart';
import 'package:grocify/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          ' Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text(' Checkout \$48.00')),
      ),
    );
  }
}
