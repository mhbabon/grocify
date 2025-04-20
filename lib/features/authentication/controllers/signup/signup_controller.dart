import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/authentication_repository.dart';
import 'package:grocify/data/repositories.authentication/user/user_repository.dart';
import 'package:grocify/features/authentication/screens/signup/verify_email.dart';
import 'package:grocify/features/personalization/models/user_model.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/helpers/network_manager.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  /// --- Signup
  void signup() async {
    try {
      /// start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information....', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'CONNECTION ERROR',
            message: 'INTERNET CONNECTION REQUIRED FOR AUTHENTICATION'
        );
        return;
      }

      /// From Validation
      if (!signupFormkey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Privacy Policy CHECK
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );

        return;
      }

      /// REGISTER USER IN THE FIREBASE AUTHENTICATION & SAVE USER DATA IN THE FIREBASE

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// SAVE AUTHENTICATED IN THE FIREBASE FIRESTORE
      ///
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// remove loader
      TFullScreenLoader.stopLoading();

      /// SHOW SUCCESS MESSAGE
      TLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! Verify email to continue');


      /// MOVE TO VERIFY EMAIL SCREEN

      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));


    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();
      // show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
