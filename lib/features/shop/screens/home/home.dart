
import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                // App Bar
                THomeAppBar(),
                const SizedBox(
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
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      // -- Categories

                      SizedBox(
                        height:80,
                        child: ListView.builder(
                          shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                      Container(
                                        width: 56,
                                        height: 56,
                                        padding: EdgeInsets.all(TSizes.sm),
                                        decoration: BoxDecoration(
                                          color: TColors.white,
                                          borderRadius: BorderRadius.circular(100)
                                        ),
                                        child: Center(
                                         child: 
                                          Image(image: AssetImage(''), fit: BoxFit.cover,color: TColors.dark,),
                                        ),
                        
                                      )
                                ],
                                );
                            } ),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
