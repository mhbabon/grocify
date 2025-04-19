import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/curved_edges/curved_edgs_widget.dart';
import 'package:grocify/common/widgets/icons/t_circular_icon.dart';
import 'package:grocify/common/widgets/images/t_rounded_image.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [

            /// Main Large Image

            const SizedBox(height: 400, child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
                  child: Image(image: AssetImage(TImages.productImage1),)),
            )
            ),

            /// --- Image Slider
            Positioned(
              left: 10,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width
                      : TSizes.spaceBtwItems,),itemBuilder: (_, index) =>
                    TRoundedImage(
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageurl: TImages.productImage1
                    ),
                ),
              ),
            ),

            /// -- AppBar Icon
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],

            )
          ],
        ),
      ) ,
    );
  }
}