import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/helpers/network_manager.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  /// --- Signup
  Future<void> signup() async {
    try {
      /// start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information....', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      /// From Validation
      if (!signupFormkey.currentState!.validate()) {
        return;
      }


      /// Privacy Policy CHECK
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');

        return;
      }

      /// REGISTER USER IN THE FIREBASE AUTHENTICATION & SAVE USER DATA IN THE FIREBASE
      /// SAVE AUTHENTICATED IN THE FIREBASE FIRESTORE
      /// SHOW SUCCESS MESSAGE
      /// MOVE TO VERIFY EMAIL SCREEN
    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      /// remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
