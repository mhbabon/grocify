import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/features/personalization/controllers/user_controller.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/constants/text_strings.dart';
import 'package:grocify/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =UserController();
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  /// Email Form
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email,),) ,

                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  // Password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) => TValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(onPressed: () => controller.hidePassword.value =! controller.hidePassword.value,
                            icon: const Icon(Iconsax.eye_slash))
                      ),),
                  ) ,

                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                  )
                ],
              )

          ),
        ),
      ),
    );
  }
}
