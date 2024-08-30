import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controllers/login_controller.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.find();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: signInView(),
    );
  }

  Widget signInView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 250,
              height: 250,
            ),
            Column(
              children: [
                const Text(
                  'Find your dream job today\nSign in with Google to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: SignInButton(
                    Buttons.google,
                    text: "Sign In With Google",
                    onPressed: loginController.handleGoogleSignIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
