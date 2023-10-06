import 'package:chat/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        LoginPage.id :(context) =>  const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.id,

    );
  }
}
