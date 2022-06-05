import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
