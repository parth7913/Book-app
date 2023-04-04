import 'dart:async';

import 'package:bookapp/utils/firehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> holdscreen() async {
    bool islogin = await FireHelper.fireHelper.cheacklogin();
    if (islogin) {
      Timer(
        Duration(seconds: 7),
        () {
          Get.offNamed('home');
        },
      );
    } else {
      Timer(
        Duration(seconds: 7),
        () {
          Get.offNamed('signin');
        },
      );
    }
  }
}
