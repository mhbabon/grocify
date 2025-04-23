import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/authentication_repository.dart';
import 'package:grocify/data/repositories.authentication/user/user_repository.dart';
import 'package:grocify/features/authentication/screens/login/login.dart';
import 'package:grocify/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';
import '../../../utils/helpers/network_manager.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();





  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();

  }

  // Fetch User Record
  Future<void> fetchUserRecord() async{
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch(e) {
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  // Save user Record from any registration provider
Future<void> saveUserRecord(UserCredential? userCredentials) async{
  try{
    if(userCredentials != null){
      //convert name to first and last
      final nameParts = UserModel.nameParts(userCredentials.user!. displayName ?? '');
      final userName = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

      // Map Data
      final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
      );
      await userRepository.saveUserRecord(user);
    }
  }catch (e) {
    TLoaders.warningSnackBar(
      title: 'Data not saved',
      message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
    );
  }
}

/// Delete Account Warning
    void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.sm),
      title: 'Delete Account',
      middleText:
      'Are you sure? You want to delete your account permanently? This action is not reversible and all of your data will be remove permanently.',
      confirm: ElevatedButton(onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: const BorderSide(color: Colors.red),
          ),
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal:TSizes.lg),
            child: Text('Delete'),
          )),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel'))
    );
    }

    /// Delete User Account
    void deleteUserAccount () async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      //First re Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty) {
        // Re verify auth Email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }else if(provider == 'password'){
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());

        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
    }

  /// Re- Authenticate before deleting
    Future<void> reAuthenticateEmailAndPasswordUser() async {
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'CONNECTION ERROR',
            message: 'INTERNET CONNECTION REQUIRED FOR AUTHENTICATION');
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());

    }catch(e){
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Oh Snap', message:  e.toString());
    }

  }

}