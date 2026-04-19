import 'package:get/get.dart';

class HomeController extends GetxController {
  var users = <Map<String, String>>[
    {"name": "User 1", "message": "Hello 👋"},
    {"name": "User 2", "message": "How are you?"},
    {"name": "User 3", "message": "Let’s chat"},
  ].obs;
}