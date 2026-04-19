import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <Map<String, dynamic>>[
    {"text": "Hello 👋", "isMe": false},
    {"text": "Hi, how are you?", "isMe": true},
  ].obs;

  final TextEditingController textController = TextEditingController();

  void sendMessage() {
    if (textController.text.trim().isEmpty) return;

    messages.add({
      "text": textController.text,
      "isMe": true,
    });

    textController.clear();
  }
}