import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rafa/models/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPassword = TextEditingController();
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF6358DC),
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register Account",
                    style: GoogleFonts.dmSans(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 15),
                Text(
                  "Please register your account",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "here !",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 35),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          controller: nameEditingController,
                          onSaved: (value) {
                            nameEditingController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full Name required.";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: InputBorder.none,
                            hintText: "Your Name",
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Email/Phone",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          controller: emailEditingController,
                          onSaved: (value) {
                            emailEditingController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email.";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: InputBorder.none,
                            hintText: "Enter your email or phone number",
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          autofocus: false,
                          controller: passwordEditingController,
                          onSaved: (value) {
                            passwordEditingController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password required.";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 character required.";
                            }
                            return null;
                          },
                          obscureText: secureText,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      secureText = !secureText;
                                    });
                                  },
                                  icon: Icon(secureText
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          autofocus: false,
                          controller: confirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please re-enter your password.";
                            }
                            if (confirmPassword.text !=
                                passwordEditingController.text) {
                              return "Password don't match.";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            confirmPassword.text = value!;
                          },
                          obscureText: secureText,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: InputBorder.none,
                              hintText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      secureText = !secureText;
                                    });
                                  },
                                  icon: Icon(secureText
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF6358DC),
                          ),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () {
                              signUP(
                                emailEditingController.text,
                                passwordEditingController.text,
                              );
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.off(LoginPage());
                              },
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Color(0xFF6358DC)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        )));
  }

  void signUP(
    String email,
    String password,
  ) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
// calling our firestore
// calling our usermodel
// sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :)");

    Get.off(LoginPage());
  }
}
