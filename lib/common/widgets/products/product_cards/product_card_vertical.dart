import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/styles/shadows.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/images/t_rounded_image.dart';
import 'package:grocify/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:grocify/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/t_brand_title_text.dart';
import 'package:grocify/features/shop/controllers/product_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/features/shop/screens/product_details/product_detail.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice) ??
            '';
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          children: [
            /// Thumbnail, wishlist Button, Discount Tag
            TRoundedContainer(
              height: 190,
              width: 190,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                     // padding: const EdgeInsets.only(top: 35),
                      imageurl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkingImage: true,
                    ),
                  ),

                  Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '$salePercentage%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                  /// --- Favourite Icon Button
                   Positioned(
                      top: 0,
                      right: 0,
                      child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///  --- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleText(
                    title: product.brand?.name ?? 'Default Name',
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// ---- Price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ), // Text
                        ), // Padding

                      // Show main Price
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),
                ProductCardAddButton(product: product,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


