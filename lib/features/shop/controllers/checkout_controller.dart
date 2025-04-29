import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/common/widgets/texts/section_heading.dart';
import 'package:grocify/features/shop/models/payment_method_model.dart';
import 'package:grocify/features/shop/screens/payment/payment_tile.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel
      .empty()
      .obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) =>
          SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(title: 'Select Payment Method',
                        showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: TImages.paypal)),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Visa', image: TImages.visa)),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: TImages.masterCard)),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google pay', image: TImages.googlePay)),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: TImages.creditCard)),
                    const SizedBox(height: TSizes.spaceBtwItems/2,),
                    const SizedBox(height: TSizes.spaceBtwSections,),

                  ],
                ),
              )
          )
    );
  }
}
