import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/brands/brand_card.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/common/widgets/effect/shimmer.dart';
import 'package:grocify/features/shop/screens/brand/brand_products.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

import '../../../features/shop/models/brand_model.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// --- Brand with Product Count
            TBrandCard(showBorder: false, brand: brand,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            /// --- Brand Top 3 Product images

            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const TShimmerEffect(width: 100, height: 100),
          errorWidget : (context, url, error) => const Icon(Icons.error),
        )
      ),
    );
  }
}
