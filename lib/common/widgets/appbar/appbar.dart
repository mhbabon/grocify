import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/device/device_utility.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);



    // Handling leading widget using `if-else`
    Widget? leadingWidget;
    if (showBackArrow) {
      leadingWidget = IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Iconsax.arrow_left,
          color: dark ? TColors.white : TColors.dark,
        ),
      );
    } else if (leadingIcon != null) {
      leadingWidget = IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(leadingIcon),
      );
    } else {
      leadingWidget = null;
    }





    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: leadingWidget,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
