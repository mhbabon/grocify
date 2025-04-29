import 'package:flutter/material.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const  EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);



    // Handling background color with if-else
    Color backgroundColor;
    if (showBackground) {
      if (dark) {
        backgroundColor = TColors.dark;
      } else {
        backgroundColor = TColors.light;
      }
    } else {
      backgroundColor = Colors.transparent;
    }

    // Handling border condition
    Border? border;
    if (showBorder) {
      border = Border.all(color: TColors.grey);
    } else {
      border = null;
    }
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              border:border,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: dark ?  TColors.darkerGrey : Colors.grey,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )),
      ),
    );
  }
}
