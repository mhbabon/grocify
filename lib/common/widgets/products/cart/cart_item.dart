import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/images/t_rounded_image.dart';
import 'package:grocify/common/widgets/texts/product_title_text.dart';
import 'package:grocify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:grocify/features/shop/models/cart_item_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(imageurl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkingImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title, Price and Size
         Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIconText(title: cartItem.brandName ?? ''),
              Flexible(child: TProductTitleText(title: cartItem.title,maxLines: 1,)),

            ],
          ),
        )
      ],
    );
  }
}