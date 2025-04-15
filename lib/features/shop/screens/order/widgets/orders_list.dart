import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:grocify/utils/constants/colors.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(width: TSizes.spaceBtwItems / 2,),


              Column(
                children: [
                  Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                  Text('07 Apr 2025', style: Theme.of(context).textTheme.headlineSmall,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
