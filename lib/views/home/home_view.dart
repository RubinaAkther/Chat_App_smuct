import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return DefaultTabController(
      length: 4,
      initialIndex: 0, // WhatsApp default chat tab
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1020),

        // ───────── APP BAR (WHATSAPP STYLE) ─────────
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0xFF14162B),
          centerTitle: false,
          title: const Text(
            "SafeChat",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white70,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white70),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white70),
              onPressed: () {},
            ),
          ],
        ),

        // ───────── BODY ─────────
        body: Column(
          children: [
            // ───────── FILTER CHIPS (WHATSAPP STYLE) ─────────
            const SizedBox(height: 12),
            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  const _WhatsAppChip(label: "All", isActive: true),
                  const _WhatsAppChip(label: "Unread"),
                  const _WhatsAppChip(label: "Groups"),

                  // ───────── PLUS ICON ─────────
                  GestureDetector(
                    onTap: () {
                      // Add your logic here
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white54,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ───────── CHAT LIST ─────────
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  itemCount: controller.users.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.white10,
                    indent: 85,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final user = controller.users[index];

                    return ListTile(
                      // FIX: Increased vertical padding to prevent internal overflow
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8, 
                      ),
                      leading: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 27,
                            backgroundColor: Color(0xFF2A2D4A),
                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white30,
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                color: const Color(0xFF25D366),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF0F1020),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        user["name"] ?? "User",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          user["message"] ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // FIX: Added MainAxisSize.min to allow the column to fit
                        mainAxisSize: MainAxisSize.min, 
                        children: [
                          const Text(
                            "12:30",
                            style: TextStyle(
                              color: Color(0xFF7C5CFF),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7C5CFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Get.toNamed(AppRoutes.chat);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // ───────── BOTTOM NAVIGATION ─────────
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF14162B),
            border: Border(top: BorderSide(color: Colors.white10)),
          ),
          child: const TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFF7C5CFF),
            unselectedLabelColor: Colors.white54,
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            tabs: [
              Tab(icon: Icon(Icons.chat_bubble), text: "Chats"),
              Tab(icon: Icon(Icons.donut_large), text: "Updates"),
              Tab(icon: Icon(Icons.groups_outlined), text: "Communities"),
              Tab(icon: Icon(Icons.call_outlined), text: "Calls"),
            ],
          ),
        ),

        // ───────── FLOATING BUTTON ─────────
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF7C5CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {},
          child: const Icon(Icons.add_comment_rounded, color: Colors.white),
        ),
      ),
    );
  }
}

// ───────── CHIP WIDGET ─────────
class _WhatsAppChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const _WhatsAppChip({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2A2D4A) : const Color(0xFF1A1C35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? const Color(0xFF7C5CFF) : Colors.white54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}