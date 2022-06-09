import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafa/auth/login.dart';

class MainController extends GetxController {
  final formkey = GlobalKey<FormState>();
  UserLogin() {
    showLoding();
    Future.delayed(const Duration(seconds: 5), () {
      hideLoading();
    });
    //Get.off(HomePage());
  }

  UserLogOut() {
    showLoding();
    Future.delayed(const Duration(seconds: 5), () {
      hideLoading();
      Get.off(LoginPage());
    });
  }

  Submit() {
    showLoding();
    Future.delayed(const Duration(seconds: 5), () {
      hideLoading();
      Get.off(LoginPage());
    });
  }

  hideLoading() {
    //Get.back();
  }
}

showLoding({String title = "Loading......"}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 20),
            Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            SizedBox(width: 20),
            Text(title),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
