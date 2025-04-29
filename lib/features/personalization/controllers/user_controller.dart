import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:grocify/data/repositories.authentication/user/user_repository.dart';
import 'package:grocify/features/authentication/screens/login/login.dart';
import 'package:grocify/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:grocify/utils/constants/image_strings.dart';
import 'package:grocify/utils/constants/sizes.dart';
import 'package:grocify/utils/popups/full_screen_loader.dart';
import 'package:grocify/utils/popups/loaders.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../utils/helpers/network_manager.dart';
import '../models/user_model.dart';

class UserController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString imageUrl = ''.obs;
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  RxString profileImageUrl = ''.obs;




  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
    fetchUserProfileImage();
  }
  static const String errorTitle = 'Oh Snap';


  // Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
// Fetch User profile Record
  Future<void> fetchUserProfileImage() async {
    try {
      final url = await userRepository.fetchUserProfileImage();
      if (url.isNotEmpty) {
        profileImageUrl.value = url;
   //     print("✅ Image URL fetched: $url");
      }
    } catch (e) {
  //    print("❌ Error fetching image URL: $e");
      // Do not reset the image here
    }
  }









  // Save user Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials == null) return;

      final uid = userCredentials.user!.uid;

      // Firestore থেকে রেকর্ড চেক করা হচ্ছে
      final doc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      if (doc.exists) {
     //   print("📥 User already exists in Firestore. Just fetching.");
        await fetchUserRecord();// আগের ইউজার রেকর্ড লোড করো
        TLoaders.successSnackBar(
            title: 'Congratulation!', message: 'Welcome to Grocify.');

      } else {
   //     print("🆕 New user. Saving to Firestore...");

        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final userName = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final newUser = UserModel(
          id: uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(newUser);
        TLoaders.successSnackBar(title: 'Congratulations!', message: ' Your account has been create!');
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
        'Something went wrong while checking or saving your information.',
      );
    }
  }

  /// Logout Account Warning
  void logoutAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.sm),
        title: 'Logout',
        middleText:
        'Are you sure? You want to logout from  your account ? ',
        confirm: ElevatedButton(
            onPressed: () async => AuthenticationRepository.instance.logout(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Logout'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }




  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.sm),
        title: 'Delete Account',
        middleText:
            'Are you sure? You want to delete your account permanently? This action is not reversible and all of your data will be remove permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      //First re Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: errorTitle, message: e.toString());
    }
  }

  /// Re- Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
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

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title:errorTitle, message: e.toString());
    }
  }




  Future<void> uploadImageAndSaveUrlToFirebase() async {
    try {
      // Pick the image
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final file = File(pickedFile.path);
      final fileName = basename(pickedFile.path);
      final fileBytes = await file.readAsBytes();
      final mimeType = lookupMimeType(fileName) ?? 'image/jpeg';

      // Upload to Supabase
      final supabase = Supabase.instance.client;
      final response = await supabase.storage.from('profile').uploadBinary(
        fileName,
        fileBytes,
        fileOptions: FileOptions(
          contentType: mimeType,
          upsert: true,
        ),
      );

      if (response.isEmpty) {
 //       print("Failed to upload image");
        return;
      }

      // Get public URL
      final publicUrl = supabase.storage.from('profile').getPublicUrl(fileName);

   //   print("Supabase Image URL: $publicUrl");

      // 🔐 Get Firebase user UID
      final userId = FirebaseAuth.instance.currentUser?.uid;
   //   print('UID :------------------$userId');
      if (userId == null) {
 //       print('User not logged in.');
        return;
      }

      // 🔄 Save URL to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'ProfilePicture': publicUrl,
      });

      // ✅ Update the local observable for GetX
      profileImageUrl.value = publicUrl;

      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile image has been updated!');

 //     print('✅ Profile image URL saved to Firestore');
    } catch (e) {
      TLoaders.errorSnackBar(title: errorTitle, message: ' Something went wrong: $e');
 //     print('❌ Error: $e');
    }
  }








}
