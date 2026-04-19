import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/users_list_controller.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersListController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),

      appBar: AppBar(
        backgroundColor: const Color(0xFF14162B),
        title: const Text("Users"),
      ),

      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1C35),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFF2A2D4A),
                  child: Icon(Icons.person, color: Colors.white70),
                ),

                title: Text(
                  user["name"]!,
                  style: const TextStyle(color: Colors.white),
                ),

                subtitle: Text(
                  user["email"]!,
                  style: const TextStyle(color: Colors.white54),
                ),

                trailing: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white54,
                ),

                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}