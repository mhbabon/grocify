import 'package:get/get.dart';
import 'package:grocify/features/personalization/controllers/address_controller.dart';
import 'package:grocify/features/shop/controllers/checkout_controller.dart';
import 'package:grocify/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(CheckoutController());

  }
}
