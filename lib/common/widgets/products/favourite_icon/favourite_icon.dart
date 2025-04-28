import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/icons/t_circular_icon.dart';
import 'package:grocify/features/shop/controllers/favourite_controller.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() =>  TCircularIcon(
          icon: controller.isFavourites(productId) ? Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavourites(productId) ? TColors.error : null,
      onPressed: () => controller..toggleFavouriteProduct(productId),
        ));
  }
}
