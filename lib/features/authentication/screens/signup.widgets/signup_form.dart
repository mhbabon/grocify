import 'package:flutter/material.dart';
import 'package:grocify/features/authentication/screens/signup.widgets/term_condition_checkbox.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            // First Name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),

            // Last name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),

        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// User Name
        TextFormField(
          decoration: InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        /// Email
        TextFormField(
          decoration: InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Icons.email_outlined)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        ///   Phone Number
        TextFormField(
          decoration: InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        ///     Password
        TextFormField(
          decoration: InputDecoration(
            labelText: TTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        ///     Terms and Condition CheckBox
        TTermsAndConditionCheckbox(),

        SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Signup Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: Text(TTexts.createAccount)),
        )
      ],
    ));
  }
}
