// ignore_for_file: prefer_const_constructors

import 'package:firebase_app/auth_controller.dart';
import 'package:firebase_app/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: h * 0.3,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("assets/img/loginimg.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                  ),
                  child: Text("Hello ",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Text("Sign In your account",
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.pinkAccent),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.pinkAccent),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    AuthController.instance.login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: w * 0.7,
                      height: h * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage("assets/img/loginbtn.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text("Sign In",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w * 0.2),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: "\t Don\'t have an account? \t",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        children: [
                          TextSpan(
                            text: "Create",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(
                                    () => SignUpPage(),
                                  ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
