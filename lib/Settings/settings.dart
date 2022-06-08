// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/models/user_model.dart';
import 'package:rafa/widgets/custom_widgets.dart';
import '../../controller/controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screens/drawer_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MainController controller = Get.put(MainController());
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF6358DC),
              Colors.purple,
              Color(0xFF6358DC),
              Colors.purple,
              Color(0xFF6358DC),
              Colors.purple,
              Colors.white,
              Colors.white
            ])),
        child: Scaffold(
            drawer: DrawerWidget(),
            key: globalKey,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: headerContainer(
                        globalKey: globalKey,
                        loggedInUser: loggedInUser,
                        controller: controller),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 600,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color: Color(0xFF6358DC),
                                size: 30,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Setting",
                                style: GoogleFonts.dmSans(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              FaIcon(
                                FontAwesomeIcons.edit,
                                size: 25,
                                color: Colors.black26,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}
