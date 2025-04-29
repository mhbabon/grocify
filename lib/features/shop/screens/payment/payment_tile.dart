import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/features/shop/controllers/checkout_controller.dart';
import 'package:grocify/features/shop/models/payment_method_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
         controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: TRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.light
            : TColors.white,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Image(
            image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      // TRoundedContainer
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    ); // ListFile
  }
}