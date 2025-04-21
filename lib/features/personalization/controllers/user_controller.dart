

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/user/user_repository.dart';
import 'package:grocify/utils/popups/loaders.dart';
import '../models/user_model.dart';

class USerController extends GetxController{
  static USerController get instance => Get.find();

  final userRepository = Get.put(UserRepository());


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

}