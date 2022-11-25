import 'package:event_keeper/event_keeper.dart';
import 'package:event_keeper/firebase_options.dart';
import 'package:event_keeper/shared/service_locator/app_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup();

  runApp(const EventKeeper());
}

Future<void> setup() async {
  await dotenv.load(fileName: '.env');

  getIt.allReady();

  AppDependencies().setup();
}
