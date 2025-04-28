import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/brands/brand_card.dart';
import 'package:grocify/common/widgets/products/sortable/sortable_products.dart';
import 'package:grocify/features/shop/controllers/brand_controller.dart';
import 'package:grocify/features/shop/models/brand_model.dart';
import 'package:grocify/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar:  TAppBar(
        title: Text(brand.name,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true, brand: brand,),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
               FutureBuilder(
                 future: controller.getBrandProducts(brandId: brand.id),
                 builder: (context, snapshot) {

                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const CircularProgressIndicator();
                   }

                   if (snapshot.hasError) {
                     return Text('Error: ${snapshot.error}');
                   }

                   if (!snapshot.hasData || snapshot.data == null) {
                     return const Text('No products available');
                   }
                   final brandProducts = snapshot.data!;

                   return TSortableProducts(products: brandProducts);
                 },
               ),
            ],
          ),
        ),
      ),
    );
  }
}
