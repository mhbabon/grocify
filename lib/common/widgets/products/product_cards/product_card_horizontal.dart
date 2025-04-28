import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/images/t_rounded_image.dart';
import 'package:grocify/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductCartHorizontal extends StatelessWidget {
  const TProductCartHorizontal({super.key,});



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        children: [
          /// --- Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      backgroundColor: dark ? TColors.dark : TColors.light,
                      imageurl: TImages.productImage1,
                      applyImageRadius: true,
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
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                /// --- Favourite Icon Button
                 const Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: ''),
                )
              ],
            ),
          ),


          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    /// -- Thumbnail Text
                const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: 'Meher Shagor Kola', smallSize: true,),
                        SizedBox(height: TSizes.spaceBtwItems / 2,),
                        TBrandTitleWithVerifiedIconText(title: 'Walmart',),
                      ],
                    ),
                  
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// pricing
                      const Flexible(child: TProductPriceText(price: '12.00')),
                      /// Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                              ),
                            )),
                      )

                    ],
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
