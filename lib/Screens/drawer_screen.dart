import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/Screens/nav_screen/expenses_page.dart';
import 'package:rafa/Screens/nav_screen/sales_page.dart';
import 'package:rafa/Settings/settings.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 30),
      child: Container(
        color: Colors.transparent,
        width: 200,
        child: Drawer(
          backgroundColor: Colors.white.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.document_scanner,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Document",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(Sales());
                      },
                      icon: Icon(
                        Icons.attach_money,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Sales",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Profile",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(Expenses());
                      },
                      icon: Icon(
                        Icons.monetization_on,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Purchases",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.comment,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Inbox",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(Settingss());
                      },
                      icon: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Settings",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
