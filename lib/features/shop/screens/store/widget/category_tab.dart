
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:grocify/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/controllers/category_controller.dart';
import 'package:grocify/features/shop/models/category_model.dart';
import 'package:grocify/features/shop/screens/all_products/all_products.dart';
import 'package:grocify/features/shop/screens/store/widget/category_brands.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Brands ---------------
             CategoryBrands(category: category),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// --- Products -------------
          FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  // Handle loader, no Record, or error message
                  final widget =
                  TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: const TVerticalProductShimmer());
                  if (widget != null) return widget;

                  // Record Found!
                  final products = snapshot.data!;



                  return Column(
                    children: [
                      TSectionHeading(title: 'You might like', onPressed: () => Get.to(AllProducts(title: category.name,
                      futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                      )),),

                      const SizedBox(height: TSizes.spaceBtwItems,),

                      TGridLayout(itemCount: products.length, itemBuilder: (_, index) =>  TProductCardVertical(product:  products[index],)),
                      const SizedBox(height: TSizes.spaceBtwSections,),

                    ],
                  );
                }
              ),

            ],
          ),
        ),
      ],
    );
  }
}
