import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocify/features/personalization/models/user_model.dart';
import 'package:grocify/utils/exceptions/tfirebase_exception.dart';
import 'package:grocify/utils/exceptions/tformat_exception.dart';
import 'package:grocify/utils/exceptions/tplatform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();


  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// Function to save user data too Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw  TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


}