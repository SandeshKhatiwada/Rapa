import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/models/user_model.dart';
import 'package:rafa/widgets/custom_widgets.dart';
import '../../controller/controller.dart';
import '../drawer_screen.dart';
import 'package:dotted_border/dotted_border.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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
                                Icons.monetization_on,
                                color: Colors.purple,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Purchase",
                                style: GoogleFonts.dmSans(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              MaterialButton(
                                minWidth: 110,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF6358DC),
                                    ),
                                    borderRadius: BorderRadius.circular(7)),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Color(0xFF6358DC),
                                      size: 10,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Vat Bill",
                                      style: GoogleFonts.dmSans(
                                          color: Color(0xFF6358DC),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              MaterialButton(
                                minWidth: 110,
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6358DC)),
                                    borderRadius: BorderRadius.circular(7)),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      //color: Colors.white,
                                      size: 10,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Other Bill",
                                      style: GoogleFonts.dmSans(fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: DottedBorder(
                              borderType: BorderType.Rect,
                              radius: Radius.circular(8),
                              color: Color(0xFF6358DC),
                              child: Container(
                                height: 320,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Image.asset("assets/bill.png"),
                                    ),
                                    SizedBox(height: 25),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: MaterialButton(
                                        height: 45,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.photo_camera,
                                              size: 35,
                                              color: Colors.black38,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Capture your file to upload",
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 16,
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "or",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: MaterialButton(
                                        height: 45,
                                        shape: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        color: Color(0xFF6358DC),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Transform.rotate(
                                              angle: 76,
                                              child: Icon(
                                                Icons.attach_file,
                                                color: Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Click to attach your file",
                                              style: GoogleFonts.dmSans(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                height: 40,
                                minWidth: 100,
                                onPressed: () {},
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6358DC)),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  "Back",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 17,
                                    color: Color(0xFF6358DC),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              MaterialButton(
                                height: 40,
                                minWidth: 100,
                                color: Color(0xFF6358DC),
                                onPressed: () {},
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF6358DC)),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  "Send",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}
