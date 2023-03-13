import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login_firebase_01/screen/Detail/View/Detail.dart';
import 'package:login_firebase_01/screen/Home/view/home.dart';
import 'package:login_firebase_01/screen/Login/login_screen.dart';
import 'package:login_firebase_01/screen/signupScreen/signupScreen.dart';
import 'package:login_firebase_01/screen/splesh/Splesh_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => Splesah_Screen(),
        'signin': (p0) => Login_Screen(),
        'home': (p0) => Home_Screen(),
        'signup': (p0) => SignUpScreen(),
        'Detail': (p0) => Detail_Page(),
      },
    ),
  );
}
