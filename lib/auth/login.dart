import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafa/auth/register.dart';
import 'package:rafa/controller/controller.dart';

import '../Screens/nav_screen/bottom_navigationbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MainController controller = Get.put(MainController());
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool secureText = true;

  //firebase
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to",
                style: GoogleFonts.akayaKanadaka(
                  fontSize: 30,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                ),
              ),
              Text(
                "RAPA",
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6358DC),
                  //letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 35),
              Text(
                "Login Account",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35),
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email/Phone",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email.";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                          hintText: "rapa@gmail.com",
                          suffixIcon: Icon(Icons.email),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required for login.";
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
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    "Remember me",
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ))
                        ],
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
                            // controller.UserLogin();
                            // signIn(
                            //   emailController.text,
                            //   passwordController.text,
                            // );
                            if (formkey.currentState!.validate()) {
                              signIn(
                                emailController.text,
                                passwordController.text,
                              );
                              controller.UserLogin();
                            }
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Color(0xFF6358DC)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void signIn(String email, String password) async {
    if (formkey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Get.offAll(Bottombar()),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
