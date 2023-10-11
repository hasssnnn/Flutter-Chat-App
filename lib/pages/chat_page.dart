import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id =
      'ChatPage'; // static to access the class by class not object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/chat.png',
              height: 50,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text('Chat',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: const ChatBubble(),
    );
  }
}
