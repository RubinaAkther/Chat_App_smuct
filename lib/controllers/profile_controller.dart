import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = "Safe User".obs;
  var email = "user@safechat.com".obs;

  void logout() {
    Get.back(); // later change to login redirect
  }
}