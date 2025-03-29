import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/features/personalization/screens/settings/settings.dart';
import 'package:grocify/features/shop/screens/home/home.dart';
import 'package:grocify/features/shop/screens/store/store.dart';
import 'package:grocify/features/shop/screens/wishlist/wishlist.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? TColors.black : Colors.white,
            indicatorColor: darkMode
                ? TColors.white.withValues(alpha: 0.1)
                : TColors.black.withValues(alpha: 0.1),
            destinations: [
              const NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Home'),
              const NavigationDestination(
                  icon: Icon(Iconsax.shop), label: 'Store'),
              const NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              const NavigationDestination(
                  icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}
