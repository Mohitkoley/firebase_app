import 'package:firebase_app/auth_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String email;
  const WelcomePage({Key? key, required this.email}) : super(key: key);

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
          Container(
            margin: const EdgeInsets.only(left: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(height: 10),
                Text(email,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 220),
          Container(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                GestureDetector(
                  onTap: () {
                    AuthController.instance.logOut();
                  },
                  child: Center(
                    child: Container(
                      width: w * 0.6,
                      height: h * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/img/loginbtn.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Text("Sign Out",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
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
