import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocify/data/repositories.authentication/authentication_repository.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/helpers/network_manager.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';

class LoginController extends GetxController {
  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('Remember_Me_Email');
    super.onInit();
  }

  /// --- Email and Password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in... ', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'CONNECTION ERROR',
            message: 'INTERNET CONNECTION REQUIRED FOR AUTHENTICATION'
        );
        return;
      }


      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember Me is Selected
      if (rememberMe.value) {
        localStorage.write('Remember_Me_Email', email.text.trim());
        localStorage.write('Remember_Me_Password', password.text.trim());
      }

      // Login User Using Email and Password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
