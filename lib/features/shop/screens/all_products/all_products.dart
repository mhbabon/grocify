import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/products/sortable/sortable_products.dart';
import 'package:grocify/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:grocify/features/shop/controllers/all_products_controller.dart';
import 'package:grocify/features/shop/models/product_model.dart';
import 'package:grocify/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});


final String title;
final Query? query;
final Future<List<ProductModel>> ? futureMethod;

  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = TVerticalProductShimmer();
              if(snapshot.connectionState == ConnectionState.waiting){
                return loader;
              }

              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return const Center(child:  Text('No data Found'));
              }

              if(snapshot.hasError){
                return const Center(child:  Text('Something went wrong'));
              }
              // Products found
              final products = snapshot.data!;

              return   TSortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
