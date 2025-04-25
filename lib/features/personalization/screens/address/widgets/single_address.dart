import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    late final Color borderColor;
    late final Color iconColor;

    if (selectedAddress) {
      borderColor = dark ? TColors.darkerGrey : TColors.grey;
      iconColor = dark ? TColors.light : TColors.dark;
    } else {
      borderColor = Colors.grey;
      iconColor = Colors.transparent;
    }


    return  TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary.withValues(alpha: 0.5) : Colors.transparent ,
      borderColor: borderColor ,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
            color: iconColor ,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               'John Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm / 2,),
              const Text('(+880) 171 2004 187', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm / 2,),
             const Padding(
                padding:  EdgeInsets.all(2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:  EdgeInsets.all(2),
                    child: Text(
                      '411621/1 Zigatola New Road, Dhanmondi, Dhaka, Bangladesh',
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
