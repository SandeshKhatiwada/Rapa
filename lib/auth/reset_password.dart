import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF6358DC),
              ))),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reset Password",
                style: GoogleFonts.dmSans(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 50),
            Text(
              "New Password",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ))),
            SizedBox(height: 25),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ))),
            SizedBox(height: 35),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF6358DC),
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  controller.Submit();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
