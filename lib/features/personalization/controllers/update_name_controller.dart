

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/user/user_repository.dart';
import 'package:grocify/features/personalization/controllers/user_controller.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/helpers/network_manager.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance =>Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


// init user data when home screen appears
  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

// Fetch User record
Future<void> initializedNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
}

  Future<void> updateUserName() async{
   try {
     // start Loading
     TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.docerAnimation);

     // check Internet Connectivity

     // check Internet connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if (!isConnected) {
       /// remove loader
       TFullScreenLoader.stopLoading();
       TLoaders.errorSnackBar(
           title: 'CONNECTION ERROR',
           message: 'INTERNET CONNECTION REQUIRED FOR AUTHENTICATION');
       return;
     }

     // Form Validation
     if (!updateUserNameFormKey.currentState!.validate()) {
       TFullScreenLoader.stopLoading();
       return;
     }

     // Update user's name in the firebase firestore
     Map<String,dynamic> name ={'FirstName' : firstName.text.trim(), 'LastName': lastName.text.trim()};
     await userRepository.updateSingleField(name);

     // Update Rx User value
     userController.user.value.firstName = firstName.text.trim();
     userController.user.value.lastName = lastName.text.trim();

     TFullScreenLoader.stopLoading();
      Get.back(result: 'updated');
     TLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated. ');

     // Move previous Screen

   }catch (e){
     TFullScreenLoader.stopLoading();
     TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
   }
  }

}