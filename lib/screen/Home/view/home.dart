import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:login_firebase_01/screen/Home/modal/homemodal.dart';
import 'package:login_firebase_01/utils/firehelper.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: globalKey,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            title: Text("Home"),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed('Detail');
                },
                icon: Icon(Icons.add, size: 30),
              ),
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
          body: StreamBuilder<QuerySnapshot>(
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
                }
                return ListView.builder(
                  itemCount: l1.length,
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FocusedMenuHolder(
                            openWithTap: true,
                            onPressed: () {},
                            menuItems: [
                              FocusedMenuItem(
                                  title: Text("Edit"),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Plese Enter the name";
                                              }
                                            },
                                            controller: txtpname,
                                            decoration: InputDecoration(
                                                hintText: "Enter your Name",
                                                border: OutlineInputBorder()),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (globalKey.currentState!
                                                  .validate()) {
                                                FireHelper
                                                    .fireHelper
                                                    .Update(l1[index].id!,
                                                        txtpname.text);
                                                  Get.back();}
                                              },
                                            child: Text("Finish"),
                                          )
                                        ],
                                      ),
                                    );
                                    FireHelper.fireHelper
                                        .Update(l1[index].id!, l1[index].name!);
                                  }),
                              FocusedMenuItem(
                                  title: Text("Delet"),
                                  onPressed: () {
                                    FireHelper.fireHelper.delet(l1[index].id!);
                                  })
                            ],
                            child: Container(
                              margin: EdgeInsets.all(15),
                              height: 200,
                              width: 280,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      "${l1[index].name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("${l1[index].Publish_Year}"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("${l1[index].other}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 150,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              color: Colors.black,
                              child: Image.network(
                                "${l1[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
