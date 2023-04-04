import 'package:bookapp/screen/Home/modal/homemodal.dart';
import 'package:bookapp/utils/firehelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: globalKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Books Information",
              style: GoogleFonts.kalam(),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  bool issingout = await FireHelper.fireHelper.signout();
                  if (issingout) {
                    Get.offNamed('signin');
                  }
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Stack(
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
              StreamBuilder<QuerySnapshot>(
                stream: FireHelper.fireHelper.getbook(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<homeModal> l1 = [];

                    var x = snapshot.data!.docs;
                    for (var y in x) {
                      Map data = y.data() as Map;

                      homeModal m1 = homeModal(
                          name: data['name'],
                          image: data['image'],
                          other: data['Other'],
                          Publish_Year: data['Publish_Year'],
                          Rating: data['Rating'],
                          id: y.id);
                      l1.add(m1);
                      print("$l1");
                    }
                    return ListView.builder(
                      itemCount: l1.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              FocusedMenuHolder(
                                openWithTap: true,
                                onPressed: () {},
                                menuItems: [
                                  FocusedMenuItem(
                                      title: Text(
                                        "Edit",
                                        style: GoogleFonts.kalam(),
                                      ),
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Edit",
                                          titleStyle: GoogleFonts.kalam(),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Book Name";
                                                  }
                                                },
                                                controller: txtpname,
                                                decoration: InputDecoration(
                                                  hintText: "Edit Book Name",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (globalKey.currentState!
                                                        .validate()) {
                                                      FireHelper.fireHelper
                                                          .Update(l1[index].id!,
                                                              txtpname.text);
                                                      Get.back();
                                                    }
                                                  },
                                                  child: Text(
                                                    "Edit",
                                                    style: GoogleFonts.kalam(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                        FireHelper.fireHelper.Update(
                                            l1[index].id!, l1[index].name!);
                                      }),
                                  FocusedMenuItem(
                                      title: Text(
                                        "Delete",
                                        style: GoogleFonts.kalam(),
                                      ),
                                      onPressed: () {
                                        FireHelper.fireHelper
                                            .delet(l1[index].id!);
                                      })
                                ],
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  width: 280,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${l1[index].name}",
                                        style: GoogleFonts.kalam(
                                            color: Colors.black,
                                            fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${l1[index].Publish_Year}",
                                        style: GoogleFonts.kalam(),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "${l1[index].other}",
                                        style: GoogleFonts.kalam(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    "${l1[index].image}",
                                    height: 150,
                                    width: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('Detail');
            },
            label: Text(
              "Add Book",
              style: GoogleFonts.kalam(),
            ),
          ),
        ),
      ),
    );
  }
}
