import 'package:chat/pages/login_page.dart';
import 'package:chat/services/sign_out.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id= 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            signOutUser();
            Navigator.pushNamed(context, LoginPage.id);

          }, icon: const Icon(Icons.exit_to_app)
      )],
      ),
    );
  }
}