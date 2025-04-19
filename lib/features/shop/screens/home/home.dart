import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/screens/all_products/all_products.dart';
import 'package:grocify/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:grocify/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';

import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // Search Bar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // -- Heading

                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        // -- Categories

                        THomeCategories(),
                        SizedBox(height: TSizes.spaceBtwSections,)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Promo Slider ---
                    const TPromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3,
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),


                    /// Heading---
                    TSectionHeading(title: 'Popular Products', onPressed: () =>Get.to(() => const AllProducts()),),
                    const SizedBox(height: TSizes.spaceBtwItems,),


                    /// ---Popular Products ---
                    TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),


                  ],
                ))
          ],
        ),
      ),
    );
  }
}
