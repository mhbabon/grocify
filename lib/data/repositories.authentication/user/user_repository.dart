import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocify/data/repositories.authentication/authentication_repository.dart';
import 'package:grocify/features/personalization/models/user_model.dart';
import 'package:grocify/utils/exceptions/firebase_exceptions.dart';
import 'package:grocify/utils/exceptions/format_exceptions.dart';
import 'package:grocify/utils/exceptions/platform_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final SupabaseClient supabase = Supabase.instance.client;



class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  RxString profileImageUrl = ''.obs;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String text = 'Something went wrong. Please try again';
   final userImageUrl = ''.obs; // using GetX
  /// Function to save user data too Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw text;
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw text;
    }
  }

  // Function to update user data in Firestore

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw text;
    }
  }

  // Update any field in specific User Collection

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw text;
    }
  }

  // Function to remove user data from FireStore

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw text;
    }
  }


 //Fetch user image  data from Firestore

  Future<String> fetchUserProfileImage() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) throw Exception("User not logged in");

      final doc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();

      if (doc.exists) {
        final imageUrl = doc.data()?['ProfilePicture'] ?? '';

      //  print('Fetch user Profile Link UserRepository------------------------------------------ $imageUrl ');
        return imageUrl;
      } else {

        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception("Failed to fetch user image: $e");
    }
  }




}

