import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/products/cart/coupon_widget.dart';
import 'package:grocify/features/shop/controllers/cart_controller.dart';
import 'package:grocify/features/shop/controllers/order_controller.dart';
import 'package:grocify/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:grocify/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:grocify/utils/helpers/pricing_caculator.dart';
import 'package:grocify/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'BD');

    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            ' Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// --- Items in Cart
                const TCartItems(
                  showAddRemoveButtons: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// --- Coupon TextField
                const TCouponCode(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// --- Billing Section

                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      /// --- Pricing
                      TBillingAmountSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --- Divider
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// ---Payment Methods
                      TBillingPaymentSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --- Address Section

                      TBillingAddressSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: subTotal > 0
                  ? () => orderController.processOrder(totalAmount)
                  : () => TLoaders.warningSnackBar(
                      title: 'Empty Cart',
                      message: "Add items in the cart in order to process"),
              child: Text(' Checkout  ৳${totalAmount.toStringAsFixed(2)}')),
        ));
  }
}
