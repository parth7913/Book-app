import 'package:bookapp/screen/splesh/Controller.dart';
import 'package:bookapp/utils/firehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';


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
          title: Text("Add Book "),
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plese enter your name ";
                      }
                    },
                    controller: txtname,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.book),
                        label: Text(" Name"),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plese enter your Author Name";
                      }
                    },
                    controller: txtrating,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.star),
                      label: Text("Rating"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plese Enter your About Book";
                      }
                    },
                    textAlign: TextAlign.start,
                    controller:txtiamge,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.image),
                      label: Text("image link"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plese Enter your Rating";
                      }
                    },
                    textAlign: TextAlign.start,
                    controller:txtother ,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("Other"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "plese enter your publish year";
                      }
                    },
                    textAlign: TextAlign.start,
                    controller: txtpyear,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_view_week),
                      label: Text("Publish Year"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FireHelper.fireHelper.getbook();
                      if (errorkey.currentState!
                          .validate()) {
                        bool isinsert = await FireHelper.fireHelper.addbook(
                            txtname.text,
                            txtother.text,
                            txtiamge.text,
                            txtrating.text,
                            txtpyear.text);
                      if(isinsert)
                        {
                          Get.snackbar("sucsefully","");
                          Get.toNamed('home');
                        }
                      else
                        {
                          Get.snackbar("Error", "plese try again");
                        }
                      }
                    },
                    child: Text("Finish"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
