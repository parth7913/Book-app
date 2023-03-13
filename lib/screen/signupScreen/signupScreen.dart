import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firebase_01/utils/firehelper.dart';

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
        body:  SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 30,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("aseets/images/back.png", fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account ",
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: txtemail,
                      decoration: InputDecoration(
                          label: Text("Email"),prefixIcon: Icon(Icons.email,color:Colors.black54,),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.white54),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: txtpassword,
                      decoration: InputDecoration(
                          label: Text("password"),prefixIcon: Icon(Icons.lock,color:Colors.black54,),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.white54),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20,
                    ),TextField(
                      controller: txtpassword,
                      decoration: InputDecoration(
                          label: Text("Confirm  password"),prefixIcon: Icon(Icons.lock,color:Colors.black54,),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, color: Colors.white54),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool insignin = await FireHelper.fireHelper
                            .signupUser(txtemail.text, txtpassword.text);
                        if (insignin) {
                          Get.offNamed('home');
                        } else {
                          Get.snackbar("not sucsesfully login ", "Plese tye again");
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: Image.asset(
                                "aseets/images/chrome.png",
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            bool isfc =await FireHelper.fireHelper.signInWithFacebook();
                            if(isfc)
                            {
                              Get.offNamed('home');
                            }
                            else
                            {
                              Get.snackbar("Login In unsucseefully","");
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 30,
                              width: 50,
                              child: Image.asset(
                                "aseets/images/facebook .png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Don't have Account?"),
                        TextButton(
                            onPressed: () {
                              Get.toNamed('signin');
                            },
                            child: Text("Sign in")),
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
