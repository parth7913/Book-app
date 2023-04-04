import 'package:bookapp/screen/splesh/Controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoldScreen extends StatefulWidget {
  const HoldScreen({Key? key}) : super(key: key);

  @override
  State<HoldScreen> createState() => _HoldScreenState();
}

class _HoldScreenState extends State<HoldScreen> {
  HomeController sp = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    sp.holdscreen();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/backround3.jpg",
                    fit: BoxFit.fill),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: ListView(
                      children: [
                        Lottie.asset("assets/lottie/booklottie.json"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Make Your Book",
                      style: GoogleFonts.kalam(color: Colors.white, fontSize: 35),
                    ),
                  ),
                  CircularProgressIndicator(color: Colors.white,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
