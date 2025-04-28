import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/brands/brand_card.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/shimmers/brands_shimmer.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/controllers/brand_controller.dart';
import 'package:grocify/features/shop/screens/brand/brand_products.dart';
import 'package:grocify/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Categories'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Categories',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Brands
              Obx(() {
                if(brandController.isLoading.value) return const TBrandsShimmer();

                if(brandController.allBrands.isEmpty){
                  return Center(
                    child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                  );
                }

                return  TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return  TBrandCard(
                        showBorder: true, 
                        brand: brand,
                        onTap: () => Get.to(() =>  BrandProducts(brand: brand)),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
