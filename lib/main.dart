import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories.authentication/authentication_repository.dart';
import 'firebase_options.dart';

import 'app.dart';

Future<void> main() async {
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();

/// GetX Local storage
  await GetStorage.init();


  /// Await Splash Until other Item Load
  FlutterNativeSplash.preserve( widgetsBinding: widgetBinding);


  // --- Initialize Firebase & Auth. Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) .then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}


