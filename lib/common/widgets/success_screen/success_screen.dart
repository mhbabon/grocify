import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/features/shop/screens/home/home.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/constants/text_strings.dart';
import 'package:grocify/utils/helpers/helper_functions.dart';
import '../../styles/spacing_styles.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle,  this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight *2,
          child: Column(
            children: [

              ///  Image
              Image(image: AssetImage(image),width: THelperFunctions.screenWidth() *0.6,),
              SizedBox(height: TSizes.spaceBtwSections,),


              ///   Title & SubTitle
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwSections,),
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwSections,),


              ///   Buttons
              SizedBox(width: double.infinity,child:ElevatedButton(onPressed: () => Get.to(()=> HomeScreen()) , child: const Text(TTexts.tContinue)) ,),


            ],
          ),
        ),
      ),
    );
  }
}
