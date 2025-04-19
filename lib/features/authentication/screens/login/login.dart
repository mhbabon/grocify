import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/login_signup/form_divider.dart';
import 'package:grocify/common/widgets/login_signup/social_buttons.dart';
import 'package:grocify/features/authentication/screens/login/widgets/loging_form.dart';
import 'package:grocify/features/authentication/screens/login/widgets/loging_header.dart';
import 'package:grocify/utils/constants/text_strings.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title and SubTitle
              const TLogingHeader(),
              const SizedBox(height: TSizes.sm,),

              /// Form
              const TLogingForm(),

              /// Divider
              TFromDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ///  Footer
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}










