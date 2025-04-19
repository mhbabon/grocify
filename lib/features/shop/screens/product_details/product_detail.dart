import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:grocify/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Product Image Slider
            const TProductImageSlider(),

            /// --- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///--- RATING AND SHARE
                  const TRatingAndShare(),

                  /// --- PRICE, Title,STOCK & Brand
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.defaultSpace,),

                  /// --- Attribute
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  ///  --checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  ///  --- Description
                  const TSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                      'Enjoy farm-fresh, delicious bananas delivered right to your doorstep! Carefully selected for quality and ripeness, our bananas are rich in flavor and packed with essential nutrients like potassium, fiber, and vitamins.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  ///  --- Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)',showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3,size: 18,))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ),
            )

            ///  ---
          ],
        ),
      ),
    );
  }
}
