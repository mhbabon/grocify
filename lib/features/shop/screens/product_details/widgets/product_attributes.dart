import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/controllers/product_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/enums.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              /// --- Title, Price & Stock
              Row(
                children: [
                  const TSectionHeading(title: 'Variation',showActionButton: false,),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                          Text('\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                           TProductPriceText(price : controller.getProductPrice(product))
                        ],
                      ),

                      /// --- Stock

                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock :  ',
                            smallSize: true,
                          ),
                          Text(product.stock.toString(), style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Quantity :  ',
                            smallSize: true,
                          ),
                          Text(product.quantity.toString(), style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      ),

                    ],
                  )
                ],
              ),

            ],
          ),
        ),


      ],
    );
  }
}
