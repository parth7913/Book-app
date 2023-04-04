import 'package:bookapp/screen/splesh/Controller.dart';
import 'package:bookapp/utils/firehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> errorkey = GlobalKey<FormState>();
  HomeController homeController = Get.put(HomeController());
  TextEditingController txtname = TextEditingController();
  TextEditingController txtother = TextEditingController();
  TextEditingController txtiamge = TextEditingController();
  TextEditingController txtrating = TextEditingController();
  TextEditingController txtpyear = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Book You Want To Add In Home Screen",
            style: GoogleFonts.kalam(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.offNamed('home');
              },
              icon: Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ],
        ),
        body: Form(
          key: errorkey,
          child: Stack(
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
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: GoogleFonts.kalam(color: Colors.white),
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Book Name ";
                          }
                        },
                        controller: txtname,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.book_outlined,
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
                          label: Text(
                            "Book Name",
                            style: GoogleFonts.kalam(),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: GoogleFonts.kalam(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Rating";
                          }
                        },
                        controller: txtrating,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
                          label: Text("Rating"),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: GoogleFonts.kalam(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Image Link";
                          }
                        },
                        textAlign: TextAlign.start,
                        controller: txtiamge,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          label: Text("Image Link"),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: GoogleFonts.kalam(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                           return "Please Enter About Book";
                          }
                        },
                        textAlign: TextAlign.start,
                        controller: txtother,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          label: Text("About Book"),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: GoogleFonts.kalam(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Publish Year";
                          }
                        },
                        textAlign: TextAlign.start,
                        controller: txtpyear,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.kalam(color: Colors.white),
                          label: Text("Publish Year"),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(35)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FireHelper.fireHelper.getbook();
                          if (errorkey.currentState!.validate()) {
                            bool isinsert = await FireHelper.fireHelper.addbook(
                                txtname.text,
                                txtother.text,
                                txtiamge.text,
                                txtrating.text,
                                txtpyear.text);
                            if (isinsert) {
                              Get.back();
                              Get.snackbar("Successfully Add", "");
                            } else {
                              Get.snackbar("Error", "Try Again");
                            }
                          }
                        },
                        child: Text(
                          "Finish",
                          style: GoogleFonts.kalam(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
