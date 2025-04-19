import 'package:flutter/material.dart';
import 'package:grocify/common/widgets/appbar/appbar.dart';
import 'package:grocify/common/widgets/images/t_circular_image.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// -- Profile Picture

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const TCircularImage(image: TImages.user,width: 80,height: 80,),
                      TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                    ],
                  ),
                ),

                /// -- Details
                const SizedBox(height: TSizes.spaceBtwItems / 2,),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),

                /// -- Heading Profile Info
                const TSectionHeading(title: 'Profile Information',showActionButton: false, ),
                const SizedBox(height: TSizes.spaceBtwItems,),

                TProfileMenu( title: 'Name', value: 'Dart Dare Devil',onPressed: () {},),
                TProfileMenu( title: 'Username', value: 'dart_dare_devil',onPressed: () {},),

                const SizedBox(height: TSizes.spaceBtwItems ,),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),

                /// -- Heading Personal Info
                const TSectionHeading(title: 'Profile Information',showActionButton: false, ),
                const SizedBox(height: TSizes.spaceBtwItems,),


                TProfileMenu( title: 'User ID', value: '12004',icon: Iconsax.copy, onPressed: () {},),
                TProfileMenu( title: 'E-mail', value: 'dart_dare_devil', onPressed: () {},),
                TProfileMenu( title: 'Phone Number', value: '+8801712-004187', onPressed: () {},),
                TProfileMenu( title: 'Gender', value: 'Male', onPressed: () {},),
                TProfileMenu( title: 'Date of Birth', value: '29 April 2002', onPressed: () {},),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems,),


                Center(
                  child: TextButton(onPressed: () {},
                      child: const Text('Close Account',style: TextStyle(color: Colors.red),)),
                )

              ],
            )

        ),
      ),
    );
  }
}


