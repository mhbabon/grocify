import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/images/t_circular_image.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --- Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
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
            const SizedBox(width: TSizes.spaceBtwItems,),
            /// Price
            Text('\$10', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const  SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: '7.5',isLarge: true,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///  --- Title
        const TProductTitleText(title: ' Banana '),
        SizedBox(height: TSizes.spaceBtwItems /1.5,),
        
        ///  --- Stock Status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems ,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///  --- Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.walmart,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIconText(title: ' Walmart', brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
