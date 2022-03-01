import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final List images = ['g.png', 'f.png', 't.png'];
  SignUpPage({Key? key}) : super(key: key);

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/signup.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              SizedBox(
                height: h * 0.14,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 60,
                backgroundImage: AssetImage("assets/img/profile1.png"),
              ),
            ]),
          ),
          const SizedBox(height: 30),
          // ignore: sized_box_for_whitespace
          Container(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.pinkAccent,
                    ),
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.email, color: Colors.pinkAccent),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.lock, color: Colors.pinkAccent),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    AuthController.instance.register(
                        emailController.text.trim(), passwordController.text);
                  },
                  child: Center(
                    child: Container(
                      width: w * 0.7,
                      height: h * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: const AssetImage("assets/img/loginbtn.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text("Sign Up",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                      text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                  )),
                ),
                SizedBox(height: w * 0.2),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Sign Up using one of the following methods",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: w * 0.1),
                Center(
                  child: Wrap(
                    children: List<Widget>.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white54,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                        "assets/img/" + images[index]),
                                  ),
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
