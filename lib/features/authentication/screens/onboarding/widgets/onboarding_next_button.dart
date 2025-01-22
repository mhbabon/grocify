import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:grocify/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? TColors.primary: Colors.black),
        onPressed: () => OnBoardingController.instance.nextPage(), child: const Icon(Iconsax.arrow_right_3,color: Colors.white,),
      ),
    );
  }
}