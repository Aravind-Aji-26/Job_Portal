import 'package:get/get.dart';
import 'package:job_portal/controllers/home_controller.dart';
import 'package:job_portal/services/api_service.dart';

import 'controllers/login_controller.dart';

Future<void> registerServices() async {
  Get.put(
    APIService(),
  );
}

Future<void> registerControllers() async {
  Get.put(
    HomeController(),
  );
  Get.put(
    LoginController(),
  );
}

String restrictToTwoWords(String text) {
  RegExp regex = RegExp(r"^\w+\s?\w+$");
  return regex.hasMatch(text) ? text : text.substring(0, text.indexOf(" ", text.indexOf(" ") + 1));
}
