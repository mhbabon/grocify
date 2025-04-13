import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:grocify/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Product Image Slider
            TProductImageSlider(),

            /// --- Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///--- RATING AND SHARE
                  TRatingAndShare(),

                  /// --- PRICE, Title,STOCK & Brand
                  TProductMetaData(),
                  SizedBox(height: TSizes.defaultSpace,),

                  /// --- Attribute
                  TProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  ///  --checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  SizedBox(height: TSizes.spaceBtwSections,),

                  ///  --- Description
                  TSectionHeading(title: 'Description', showActionButton: false,),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  ReadMoreText(
                      'Enjoy farm-fresh, delicious bananas delivered right to your doorstep! Carefully selected for quality and ripeness, our bananas are rich in flavor and packed with essential nutrients like potassium, fiber, and vitamins.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  ///  --- Review
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)',showActionButton: false,),
                      IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_3,size: 18,))
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections,)
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
