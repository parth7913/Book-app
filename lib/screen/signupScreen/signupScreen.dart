import 'package:bookapp/utils/firehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      "Create Account ",
                      style: GoogleFonts.kalam(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      style: GoogleFonts.kalam(color: Colors.white),
                      controller: txtemail,
                      decoration: InputDecoration(
                          label: Text("Username"),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
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
                    TextField(keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.white,
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
                    TextField(keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.white,
                      style: GoogleFonts.kalam(color: Colors.white),
                      controller: txtpassword,
                      decoration: InputDecoration(
                          label: Text(
                            "Confirm  Password",
                            style: GoogleFonts.kalam(),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
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
                    ElevatedButton(
                      onPressed: () async {
                        bool insignup = await FireHelper.fireHelper
                            .signupUser(txtemail.text, txtpassword.text);
                        if (insignup) {
                          Get.offNamed('home');
                        } else {
                          Get.snackbar(
                            "Login Failed",
                            "Please Try Again", colorText: Colors.white,
                            backgroundColor: Colors.black54,
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
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
                              Get.snackbar("login in unsucseefully", "");
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 40,
                              width: 40,
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
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have Account?",
                          style: GoogleFonts.kalam(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('signin');
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.kalam(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
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
