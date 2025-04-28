import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/curved_edges/curved_edgs_widget.dart';
import 'package:grocify/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:grocify/features/shop/controllers/product_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';



class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
  });

final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child:  Stack(
          children: [

            /// Main Large Image

            SizedBox(height: 400, child: Padding(
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
                  child:GestureDetector(
                    onTap: () => controller.showEnlargedImage(product.thumbnail) ,
                      child: Image.network(product.thumbnail))
              ),
            )
            ),

            /// --- Image Slider
            // Positioned(
            //   left: 10,
            //   right: 0,
            //   bottom: 30,
            //   child: SizedBox(
            //     height: 80,
            //     child: ListView.separated(
            //       itemCount: 6,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       separatorBuilder: (_, __) => const SizedBox(width
            //           : TSizes.spaceBtwItems,),itemBuilder: (_, index) =>
            //         TRoundedImage(
            //             width: 80,
            //             backgroundColor: dark ? TColors.dark : TColors.white,
            //             border: Border.all(color: TColors.primary),
            //             padding: const EdgeInsets.all(TSizes.sm),
            //             imageurl: TImages.productImage1
            //         ),
            //     ),
            //   ),
            // ),
            // if you want to add product variation

            /// -- AppBar Icon
            TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: product.id)
              ],

            )
          ],
        ),
      ) ,
    );
  }




}