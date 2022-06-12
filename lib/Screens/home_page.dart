// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafa/Screens/drawer_screen.dart';
import 'package:rafa/Screens/nav_screen/expenses_page.dart';
import 'package:rafa/Screens/nav_screen/sales_page.dart';
import 'package:rafa/Settings/settings.dart';
import 'package:rafa/models/user_model.dart';
import '../controller/controller.dart';
import '../widgets/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Colors.purple
          ])),
      child: Scaffold(
        drawer: DrawerWidget(),
        key: globalKey,
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: headerContainer(
                    globalKey: globalKey,
                    loggedInUser: loggedInUser,
                    controller: controller),
              ),
              SizedBox(height: 50),
              SingleChildScrollView(
                child: Container(
                  // height: 550,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            homeContainer(
                              onTap: () {},
                              text: "Document",

                              icon: Icon(
                                Icons.document_scanner,
                                size: 35,
                                color: Colors.purple,
                              ),
                              // iconColor: Colors.purple,
                            ),
                            homeContainer(
                              onTap: () {
                                Get.to(Sales());
                              },
                              text: "Sales",

                              icon: Icon(
                                Icons.attach_money,
                                size: 35,
                                color: Colors.purple,
                              ),
                              // iconColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            homeContainer(
                              onTap: () {},
                              text: "Profile",

                              icon: Icon(
                                Icons.person,
                                size: 35,
                                color: Colors.purple,
                              ),
                              // iconColor: Colors.purple,
                            ),
                            homeContainer(
                              onTap: () {
                                Get.to(Expenses());
                              },
                              text: "Purchase",

                              icon: Icon(
                                Icons.monetization_on,
                                size: 35,
                                color: Colors.purple,
                              ),
                              //iconColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            homeContainer(
                              onTap: () {},
                              text: "Inbox",

                              icon: Icon(
                                Icons.comment,
                                size: 35,
                                color: Colors.purple,
                              ),
                              // iconColor: Colors.purple,
                            ),
                            homeContainer(
                              onTap: () {
                                Get.to(Settingss());
                              },

                              text: "Settings",

                              icon: Icon(
                                Icons.settings,
                                size: 35,
                                color: Colors.purple,
                              ),
                              // iconColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
