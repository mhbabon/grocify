import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/icons/t_circular_icon.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:grocify/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:grocify/features/shop/controllers/favourite_controller.dart';
import 'package:grocify/features/shop/screens/all_products/all_products.dart';
import 'package:grocify/features/shop/screens/home/home.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/cloud_helper_functions.dart';
import 'package:grocify/utils/loaders/animation_loader.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
              () => FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () => Get.off(() => const AllProducts( title: 'All Products',
                    )),
                  );

                  const loader = TVerticalProductShimmer(
                    itemCount: 6,
                  );
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                            product: products[index],
                          ));
                }),
          ),
        ),
      ),
    );
  }
}
