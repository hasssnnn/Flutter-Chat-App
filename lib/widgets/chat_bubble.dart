import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal[900]!,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16))),
        padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
        margin: const EdgeInsets.all(12),
        child: const Text(
          'I am a new user I am a new userI am a new userI am a new userI am a new userI am a new userI am a new userI am a new userI am a new userI am a new userI am a new user',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
