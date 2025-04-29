import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/features/personalization/controllers/address_controller.dart';
import 'package:grocify/features/personalization/models/address_model.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap,});

final AddressModel address;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final dark = THelperFunctions.isDarkMode(context);



    // if (selectedAddress) {
    //   borderColor = dark ? TColors.darkerGrey : TColors.grey;
    //   iconColor = dark ? TColors.light : TColors.dark;
    // } else {
    //   borderColor = Colors.grey;
    //   iconColor = Colors.transparent;
    // }


    return  Obx(
      ()  {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: _getBackgroundColor(selectedAddress),
            borderColor: _getBorderColor(selectedAddress, dark),
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                    color:_getIconColor(selectedAddress, dark) ,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: TSizes.sm / 2,),
                     Text( address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: TSizes.sm / 2,),
                    Padding(
                      padding:  const EdgeInsets.all(2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding:  const EdgeInsets.all(2),
                          child: Text(
                            address.toString(),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

          ),
        );
      }
    );
  }

  Color _getBackgroundColor(bool selectedAddress) =>
      selectedAddress ? TColors.primary.withValues(alpha: 0.5) : Colors.transparent;

  Color _getBorderColor(bool selectedAddress, bool dark) =>
      selectedAddress ? Colors.transparent : (dark ? TColors.darkerGrey : TColors.grey);

  Color? _getIconColor(bool selectedAddress, bool dark) =>
      selectedAddress ? (dark ? TColors.light : TColors.dark) : null;


}




