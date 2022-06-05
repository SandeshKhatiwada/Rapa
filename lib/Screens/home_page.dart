import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/Screens/drawer_screen.dart';
import 'package:rafa/models/user_model.dart';
import '../widgets/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  int _currentIndex = 0;
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
                child: Container(
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
                                  if (globalKey.currentState!.isDrawerOpen ==
                                      false) {
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
                                        fontSize: 18,
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
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: 50,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SingleChildScrollView(
                child: Container(
                  // height: 550,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
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
                              onTap: () {},
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
                              onTap: () {},
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
                              onTap: () {},
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
              )
            ],
          ),
        )),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                  size: 30,
                ),
                label: "DASHBOARD",
                backgroundColor: Colors.purple),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                  size: 30,
                ),
                label: "EXPENSES",
                backgroundColor: Colors.purple),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on,
                  size: 30,
                ),
                label: "SALES",
                backgroundColor: Colors.purple),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
