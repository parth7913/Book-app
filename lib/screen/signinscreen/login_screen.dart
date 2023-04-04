import 'package:bookapp/utils/firehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({Key? key}) : super(key: key);

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style:
                          GoogleFonts.kalam(color: Colors.white, fontSize: 50),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      style: GoogleFonts.kalam(color: Colors.white),
                      controller: txtemail,
                      decoration: InputDecoration(
                          label: Text(
                            "Email Address",
                            style: GoogleFonts.kalam(),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField( cursorColor: Colors.white,
                      style: GoogleFonts.kalam(color: Colors.white),
                      controller: txtpassword,
                      decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: GoogleFonts.kalam(),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool insignin = await FireHelper.fireHelper
                            .signinUser(txtemail.text, txtpassword.text);
                        if (insignin) {
                          Get.offNamed('home');
                        } else {
                          Get.snackbar(
                            "Please Enter Email Or Password",
                            "",
                            colorText: Colors.white,
                            backgroundColor: Colors.black54,
                          );
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.kalam(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(270, 50),
                          backgroundColor: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            bool insign =
                                await FireHelper.fireHelper.signInWithGoogle();
                            if (insign) {
                              Get.offNamed('home');
                            } else {
                              Get.snackbar("Login In Unsucseefully", "");
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 45,
                              width: 45,
                              child: Image.asset(
                                "assets/images/Goog.png",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 50,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have Account?",
                          style: GoogleFonts.kalam(
                              color: Colors.white, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('signup');
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.kalam(
                                color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
