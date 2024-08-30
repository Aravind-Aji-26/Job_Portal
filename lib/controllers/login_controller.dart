import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_portal/controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    _auth.authStateChanges().listen((event) {
      user = event;
      if (user != null) {
        saveUserToken(user!.uid);
        Get.offAllNamed('/home');
      }
    });
  }

  Future<void> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      // User is already logged in, navigate to home
      Get.find<HomeController>().onInit();
      Get.offAllNamed('/home');
    } else {
      // User is not logged in, navigate to login
      Get.offAllNamed('/login');
    }
  }

  Future<void> saveUserToken(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      final UserCredential userCredential = await _auth.signInWithProvider(googleAuthProvider);
      user = userCredential.user;

      if (user != null) {
        await saveUserToken(user!.uid);
        Get.offAllNamed('/home');
      }
    } catch (error) {
      print(error);
    }
  }
}
