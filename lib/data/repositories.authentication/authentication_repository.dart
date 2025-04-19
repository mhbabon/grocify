import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocify/features/authentication/screens/login/login.dart';
import 'package:grocify/features/authentication/screens/onboarding/onboarding.dart';
import 'package:grocify/utils/exceptions/tfirebase_auth_exception.dart';
import 'package:grocify/utils/exceptions/tfirebase_exception.dart';
import 'package:grocify/utils/exceptions/tformat_exception.dart';
import 'package:grocify/utils/exceptions/tplatform_exception.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  /// Variable
   final deviceStorage = GetStorage();
   final _auth = FirebaseAuth.instance;



   /// Call from main.dart on app launch
    @override
  void onReady(){
      // Remove the native splash screen
      FlutterNativeSplash.remove();
      screenRedirect();
    }




  ///Function to show Relevant Screen
    screenRedirect()async{
    // local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());

    }

    /*--------------------- Email and Password Sign-in --------------------*/

/// [Email Authentication] - SignIn
/// [Email Authentication] - Register
    Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
      try{
        return await  _auth.createUserWithEmailAndPassword(email: email, password: password,);
      } on FirebaseAuthException catch (e){
        throw TFirebaseAuthException(e.code).message;
      }on FirebaseException catch (e){
        throw TFirebaseException(e.code).message;
      }on FormatException catch (_){
        throw TFormatException();
      }on PlatformException catch (e){
        throw TPlatformException(e.code).message;

    }catch (e) {
        throw 'Something went wrong. Please try again';
      }
      }
}

