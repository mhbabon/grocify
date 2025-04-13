import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/texts/product_price_text.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                  TSectionHeading(title: 'Variation',showActionButton: false,),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text('\$10',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          TProductPriceText(price: '7.5')
                        ],
                      ),

                      /// --- Stock

                      Row(
                        children: [
                          TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),

              /// -- Variation Description
              TProductTitleText(
                  title:
                      'This is the Description of the product and it can go up to max four lines.',
                  smallSize: true,
                  maxLines: 4,
              )
            ],
          ),
        ),


      ],
    );
  }
}
