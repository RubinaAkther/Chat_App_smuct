import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),

      // ───────── APP BAR ─────────
      appBar: AppBar(
        backgroundColor: const Color(0xFF14162B),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // ───────── BODY ─────────
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 30),

              // ───────── PROFILE CARD ─────────
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C35),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    // ───────── AVATAR ─────────
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF7C5CFF),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Color(0xFF2A2D4A),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ───────── NAME ─────────
                    Text(
                      controller.name.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // ───────── EMAIL ─────────
                    Text(
                      controller.email.value,
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ───────── EDIT BUTTON ─────────
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7C5CFF),
                            Color(0xFF4CFF88),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ───────── OPTIONS CARD ─────────
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C35),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),

                child: Column(
                  children: [

                    _buildOption(Icons.lock, "Privacy"),
                    _buildDivider(),
                    _buildOption(Icons.notifications, "Notifications"),
                    _buildDivider(),
                    _buildOption(Icons.security, "Security"),
                    _buildDivider(),
                    _buildOption(Icons.help, "Help"),

                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ───────── LOGOUT ─────────
              GestureDetector(
                onTap: controller.logout,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 16, color: Colors.white38),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Colors.white10, height: 10);
  }
}