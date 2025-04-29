import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/utils/constants/sizes.dart';

import '../../../../personalization/controllers/address_controller.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Obx(
      () => Column(
        children: [
          TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),

         addressController.selectedAddress.value.id.isNotEmpty
        ? Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
              addressController.selectedAddress.value.name,
               style: Theme.of(context).textTheme.bodyLarge,
             ),
             const SizedBox(
               height: TSizes.spaceBtwItems / 2,
             ),
             Row(
               children: [
                 const Icon(
                   Icons.phone,
                   color: Colors.grey,
                   size: 16,
                 ),
                 const SizedBox(
                   width: TSizes.spaceBtwItems,
                 ),
                 Text(
                  ' +(88)${addressController.selectedAddress.value.phoneNumber}',
                   style: Theme.of(context).textTheme.bodyMedium,
                 ),
               ],
             ),
             const SizedBox(
               height: TSizes.spaceBtwItems / 2,
             ),
             Row(
               children: [
                 const Icon(
                   Icons.location_history,
                   color: Colors.grey,
                   size: 16,
                 ),
                 const SizedBox(
                   width: TSizes.spaceBtwItems,
                 ),
                 Expanded(
                   child: Text(
                     addressController.selectedAddress.value.toString(),
                     style: Theme.of(context).textTheme.bodyMedium,
                     softWrap: true,
                   ),
                 ),
               ],
             )
           ],
         ) : Text('Select Address', style:  Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
