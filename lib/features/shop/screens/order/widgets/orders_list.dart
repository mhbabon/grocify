import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/features/shop/controllers/order_controller.dart';
import 'package:grocify/navigation_menu.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/cloud_helper_functions.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:grocify/utils/loaders/animation_loader.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: TImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          ); // TAnimationLoaderWidget

          /// Helper Function: Handle Loader, No Record, OR ERROR Message
          final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations 🥳 Record found.
          final orders = snapshot.data!;
        return ListView.separated(
          separatorBuilder: (_, index) => const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          itemCount: orders.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final order = orders[index];

            return  TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// --- Row 1
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: TColors.primary, fontWeightDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right_34,
                            size: TSizes.iconSm,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// --- Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order',
                                      style: Theme.of(context).textTheme.labelMedium),
                                  Text(
                                    order.id,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// --- Row 2
                ],
              ),
            );
          }
        );
      }
    );
  }
}
