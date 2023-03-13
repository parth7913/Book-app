import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_firebase_01/utils/firehelper.dart';

class HomeController extends GetxController {


  Future<void> holdscreen() async {
    bool islogin = await FireHelper.fireHelper.cheacklogin();
    if (islogin) {
      Timer(
        Duration(seconds: 3),
        () {
          Get.offNamed('home');
        },
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () {
          Get.offNamed('signin');
        },
      );
    }
  }
}
