import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/chat_controller.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),
      
      // ───────── WHATSAPP STYLE APP BAR ─────────
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF14162B),
        leadingWidth: 75,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 22, color: Colors.white),
              SizedBox(width: 4),
              CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF2A2D4A),
                child: Icon(Icons.person, size: 22, color: Colors.white70),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {}, // Profile logic
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "online",
                  style: TextStyle(fontSize: 12, color: Color(0xFF7C5CFF)),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),

      // ───────── BODY ─────────
      body: Container(
        // Tip: Ekhane texture image dile pura WhatsApp feel ashbe
        child: Column(
          children: [
            // ───────── MESSAGES LIST ─────────
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final msg = controller.messages[index];
                    final isMe = msg["isMe"] == true;

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 4,
                          left: isMe ? 60 : 0,
                          right: isMe ? 0 : 60,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isMe ? const Color(0xFF7C5CFF) : const Color(0xFF1A1C35),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(15),
                            topRight: const Radius.circular(15),
                            bottomLeft: Radius.circular(isMe ? 15 : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 15),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 45, bottom: 10),
                              child: Text(
                                msg["text"]!,
                                style: const TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  Text(
                                    "10:45 AM",
                                    style: TextStyle(
                                      color: isMe ? Colors.white70 : Colors.white38,
                                      fontSize: 10,
                                    ),
                                  ),
                                  if (isMe) ...[
                                    const SizedBox(width: 4),
                                    const Icon(Icons.done_all, size: 14, color: Colors.black),
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ───────── WHATSAPP FLOATING INPUT ─────────
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C35),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white38),
                            onPressed: () {},
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.textController,
                              cursorColor: const Color(0xFF7C5CFF),
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Message",
                                hintStyle: TextStyle(color: Colors.white38),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.attach_file, color: Colors.white38),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt_rounded, color: Colors.white38),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Round Send Button
                  GestureDetector(
                    onTap: controller.sendMessage,
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xFF7C5CFF),
                      child: Icon(Icons.send, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}