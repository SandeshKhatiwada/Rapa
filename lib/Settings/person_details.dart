import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({Key? key}) : super(key: key);

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
                "Name",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "John Doe",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Email",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "info@gmail.com",
                      contentPadding: const EdgeInsets.only(left: 15, top: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Mobile number",
                style: GoogleFonts.dmSans(color: Colors.black45, fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "9800000000",
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
              Text(
                "Upload profile image",
                style:
                    GoogleFonts.dmSans(color: Color(0xFF6358DC), fontSize: 18),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black38,
                    )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          height: 35,
                          minWidth: 150,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Colors.grey[200],
                          onPressed: () {},
                          child: Text(
                            "Choose File",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "No File Choosen",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              //letterSpacing: 1.5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
              // SizedBox(height: 20),
            ],
          ),
        )),
      ),
    );
  }
}
