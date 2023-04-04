import 'package:bookapp/screen/Detail/View/Detail.dart';
import 'package:bookapp/screen/Home/view/home.dart';
import 'package:bookapp/screen/Login/login_screen.dart';
import 'package:bookapp/screen/signupScreen/signupScreen.dart';
import 'package:bookapp/screen/splesh/Splesh_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => HoldScreen(),
        'signin': (p0) => signinscreen(),
        'home': (p0) => HomeScreen(),
        'signup': (p0) => SignUpScreen(),
        'Detail': (p0) => AddPage(),
      },
    ),
  );
}
