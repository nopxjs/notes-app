import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:notes_app/services/login_page.dart';

// ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Firebase.initializeApp(); //initilization of Firebase app

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: Platform.isWindows ? 80 : 50,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: Platform.isWindows ? 80 : 60,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
