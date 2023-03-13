import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_01/screen/splesh/Controller.dart';

class Splesah_Screen extends StatefulWidget {
  const Splesah_Screen({Key? key}) : super(key: key);

  @override
  State<Splesah_Screen> createState() => _Splesah_ScreenState();
}

class _Splesah_ScreenState extends State<Splesah_Screen> {
  HomeController sp = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    sp.holdscreen();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(alignment: Alignment.topCenter, children: [
            Container(
              height: MediaQuery.of(context).size.height - 30,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("aseets/images/back.png", fit: BoxFit.fill),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 400,width: 400,
                  child: ListView(
                    children: [
                      Lottie.asset("aseets/json/01.json"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(270, 50), backgroundColor: Colors.white54),
                ),
                SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(250, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.white12),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
