import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:grocify/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:grocify/common/widgets/list_tile/user_profile_tile.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/personalization/screens/address/address.dart';
import 'package:grocify/features/personalization/screens/profile/profile.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  --- Header

            TPrimaryHeaderContainer(child: Column(
              children: <Widget>[
                //  --- AppBar
               TAppBar(
                 title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),
                const SizedBox(height: TSizes.spaceBtwSections,),
                
                
                // --- UserProfileCard
                
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                 SizedBox(height: TSizes.spaceBtwSections,),
              ],
            ) ),
            // --- Body

            Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

            child:Column(
              children: [
                /// -- Account Settings
                TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.spaceBtwItems,),

                TSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping delivery address', onTap: () =>Get.to(() => UserAddressScreen()),),
                TSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move to checkout', onTap: () {},),
                TSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subTitle: 'In-progress and Completed Orders', onTap: () {},),
                TSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account', onTap: () {},),
                TSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of al the discounted coupons', onTap: () {},),
                TSettingsMenuTile(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message', onTap: () {},),
                TSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts', onTap: () {},),


                /// -- App Settings
                SizedBox(height: TSizes.spaceBtwSections,),
                TSectionHeading(title: 'App Settings', showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems,),
                TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                TSettingsMenuTile(icon: Iconsax.location, title: 'BDLocation ', subTitle: 'Set recommendation based on location',trailing: Switch(value: true , onChanged: (value) {}),),
                TSettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode ', subTitle: 'Search result is safe for all aes',trailing: Switch(value: false , onChanged: (value) {}),),
                TSettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality ', subTitle: 'Set image quality to be seen',trailing: Switch(value: false , onChanged: (value) {}),),

                /// --- Logout Button
                const SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () { }, child: const Text('Logout')),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5,),

              ],
            ) ,
            )
          ],
        ),
      ),
    );
  }
}


