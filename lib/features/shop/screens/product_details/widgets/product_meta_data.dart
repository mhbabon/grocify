import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/images/t_circular_image.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:grocify/features/shop/controllers/product_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/constants/sizes.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            /// Price Tag
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const  SizedBox(width: TSizes.spaceBtwItems,),
             TProductPriceText(price: controller.getProductPrice(product),isLarge: true,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///  --- Title
         TProductTitleText(title: product.title),
        const SizedBox(height: TSizes.spaceBtwItems /1.5,),
        
        ///  --- Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems ,),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        ///  --- Brand
        Row(
          children: [
            TCircularImage(
              isNetworkImage: true,
                image: product.brand!= null ?product.brand!.image : '',
              width: 45,
              height: 45,
             // overlayColor: darkMode ? TColors.white : TColors.black,
            ),
             TBrandTitleWithVerifiedIconText(title: product.brand != null ? product.brand!.name : '', brandTextSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
