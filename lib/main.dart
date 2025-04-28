import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'data/repositories.authentication/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  /// GetX Local storage
  await GetStorage.init();

  /// Await Splash Until other Item Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  // --- Initialize Firebase & Auth. Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));





  // --- Initialize SupBase
  await Supabase.initialize(
    url: dotenv.env['API_URL'] ?? '',
    anonKey: dotenv.env['API_KEY'] ?? '',
  );
  Supabase.instance.client;


  runApp(const App());
}
