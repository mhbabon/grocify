import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocify/features/authentication/screens/login/login.dart';
import 'package:grocify/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  /// Variable
   final deviceStorage = GetStorage();



   /// Call from main.dart on app launch
    @override
  void onReady(){
      FlutterNativeSplash.remove();
      screenRedirect();
    }




  ///Function to show Relevant Screen
    screenRedirect()async{
    // local storage

      if(kDebugMode){
        print('========================== GET STORAGE Repo==========================');
        print(deviceStorage.read('ISFirstTime'));
      }
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => LoginScreen()) : Get.offAll(OnBoardingScreen());

    }

}