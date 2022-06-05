import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/auth/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF6358DC), Colors.purple])),
      // backgroundColor: Color(0xFF6358DC),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/logo.png"),
                        SizedBox(height: 35),
                        Text(
                            "Invoice mangement\ntools you most need\nto run your business\nin one app",
                            style: GoogleFonts.lato(
                              letterSpacing: 1.5,
                              wordSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Text(
                          "invoice, expensis,\ntracking online, report\nand much more",
                          style: GoogleFonts.inconsolata(
                              fontSize: 20,
                              color: Colors.white,
                              wordSpacing: 2),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 65, right: 50),
                  child: Container(
                    height: 40,
                    //width: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: MaterialButton(
                      // elevation: 10,
                      onPressed: () {
                        Get.off(LoginPage());
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20, wordSpacing: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: Image.asset(
                    "assets/drawing.png",
                    alignment: Alignment.bottomCenter,
                    height: 200,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
