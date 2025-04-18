import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/appbar/tabbar.dart';
import 'package:grocify/common/widgets/brands/brand_card.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:grocify/common/widgets/layouts/grid_layout.dart';
import 'package:grocify/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/screens/brand/all_brands.dart';
import 'package:grocify/features/shop/screens/store/widget/category_tab.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(

            /// --- Header
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          TSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwSections,
                          ),

                          /// --- Featured Brands
                          TSectionHeading(
                            title: 'Feature Categories',
                            showActionButton: true,
                            onPressed: () =>Get.to(() => AllBrandsScreen()),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 1.5,
                          ),

                          TGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return TBrandCard(
                                  showBorder: false,
                                );
                              })
                        ],
                      ),
                    ),

                    /// Tabs---

                    bottom: TTabBar(tabs: [
                      Tab(
                        child: Text('Vegetable'),
                      ),
                      Tab(
                        child: Text('Fruits'),
                      ),
                      Tab(
                        child: Text('Beverages'),
                      ),
                      Tab(
                        child: Text('Meat and Fish'),
                      ),
                      Tab(
                        child: Text('Chocolate'),
                      ),
                    ])),
              ];
            },
            body: TabBarView(children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ])),
      ),
    );
  }
}
