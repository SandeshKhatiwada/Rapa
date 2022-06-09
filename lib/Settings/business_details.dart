import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Organization Name",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Hulas Group",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Address",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Putalisadak, Kathmandu",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Website",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "www.hulasgroup.com",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Phone",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "01-151515",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    height: 40,
                    minWidth: 100,
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6358DC)),
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
                        borderSide: BorderSide(color: Color(0xFF6358DC)),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      "Save",
                      style: GoogleFonts.dmSans(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        )),
      ),
    );
  }
}
