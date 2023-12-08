import 'package:cow_cold/data/source/local/prefs.dart';
import 'package:cow_cold/data/source/local/storage.dart';
import 'package:cow_cold/firebase_options.dart';
import 'package:cow_cold/view/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/.env');
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final appInstallFlag = Prefs.getBool(Prefs.appInstallFlag);
  if (!appInstallFlag) {
    Storage.deleteAll();
    Prefs.setBool(Prefs.appInstallFlag, true);
  }

  runApp(const MyApp());
}
