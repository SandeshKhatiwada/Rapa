import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafa/auth/login.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
              height: 200,
              child: DrawerHeader(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.off(LoginPage());
                      },
                      child: Text("Log Out"))))
        ],
      ),
    );
  }
}
