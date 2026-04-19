import 'package:get/get.dart';

class UsersListController extends GetxController {
  var users = <Map<String, String>>[
    {"name": "John Doe", "email": "john@mail.com"},
    {"name": "Sarah Khan", "email": "sarah@mail.com"},
    {"name": "Alex Smith", "email": "alex@mail.com"},
    {"name": "Emma Watson", "email": "emma@mail.com"},
  ].obs;
}