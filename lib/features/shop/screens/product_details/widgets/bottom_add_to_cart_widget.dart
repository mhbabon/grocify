import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/icons/t_circular_icon.dart';
import 'package:grocify/features/shop/controllers/cart_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Obx(
                  () => Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
               TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => controller.productQuantityInCart.value += 1,
              ),
            ],
          ),
          ElevatedButton(onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product) ,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black)
              ),
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
