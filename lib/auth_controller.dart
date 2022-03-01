import 'package:firebase_app/login_page.dart';
import 'package:firebase_app/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //AuthController.instance..
  static AuthController instance = Get.find();
  //email,password,name ..
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user will be notified when the user changes
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => WelcomePage(
            email: user.email.toString(),
          ));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About User',
        "user Registration failed",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text("User registration Failed",
            style: TextStyle(color: Colors.white)),
        messageText:
            Text(e.toString(), style: const TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 2),
        isDismissible: true,
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About Login',
        "login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText:
            const Text("Login failed", style: TextStyle(color: Colors.white)),
        messageText:
            Text(e.toString(), style: const TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 2),
        isDismissible: true,
      );
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
