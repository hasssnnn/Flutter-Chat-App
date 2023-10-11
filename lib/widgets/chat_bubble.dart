import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[900]!,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight:Radius.circular(16),
          bottomRight: Radius.circular(16)

      )),
      height: 65,
      width: 300,
      margin: const EdgeInsets.all(16),
      child: const Center(child: Text('I am a new user', style: TextStyle(color:Colors.white),)),
    );
  }
}