// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/Settings/settings.dart';

import '../controller/controller.dart';
import '../models/user_model.dart';

class homeContainer extends StatelessWidget {
  homeContainer({
    required this.onTap,
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  VoidCallback onTap;
  String text;

  Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(-1, 1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}

class headerContainer extends StatelessWidget {
  const headerContainer({
    Key? key,
    required this.globalKey,
    required this.loggedInUser,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;
  final UserModel loggedInUser;
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (globalKey.currentState!.isDrawerOpen == false) {
                          globalKey.currentState!.openDrawer();
                        } else {
                          globalKey.currentState!.openDrawer();
                        }
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: GoogleFonts.openSans(
                              fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "${loggedInUser.name}",
                          style: GoogleFonts.openSans(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notification_add_outlined,
                            size: 30,
                            color: Colors.white,
                          )),
                      SizedBox(width: 10),
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: AssetImage("assets/user.jpg"),
                      //   backgroundColor: Colors.transparent,
                      //)
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: "",
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      Get.to(Settings());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.settings,
                                          size: 30,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Settings",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "",
                                          content: Text(
                                              "Are you sure want to logout?"),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black12)),
                                                    onPressed: () {
                                                      controller.UserLogOut();
                                                    },
                                                    child: Text("Yes"),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black12)),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("No"),
                                                  ),
                                                )
                                              ],
                                            )
                                          ]);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout_outlined,
                                          size: 30,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Log Out",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        },
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
