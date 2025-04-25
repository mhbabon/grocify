import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'data/repositories.authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();


  /// GetX Local storage
  await GetStorage.init();

  /// Await Splash Until other Item Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  // --- Initialize Firebase & Auth. Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // --- Initialize SupBase
  await Supabase.initialize(
    url: 'https://rhnzkaobydswlfoiluyo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJobnprYW9ieWRzd2xmb2lsdXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU0MTE4MDMsImV4cCI6MjA2MDk4NzgwM30.eRPs3KdOaKWeKk8m_ItyJVzWHZC0crl1pHcXLzeMJfI',
  );
  Supabase.instance.client;

  runApp(const App());
}
