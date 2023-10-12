import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
TextEditingController controller = TextEditingController();
  var db = FirebaseFirestore
      .instance;
       final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('messages').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
       stream: _usersStream,
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
          if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
          }

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return const ChatBubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              controller: controller,
                onSubmitted: (value){
                  db.collection("messages").add({'message': value}).then(
                      (DocumentReference doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                          controller.clear();

                 },
                cursorColor: Colors.teal[900],
                decoration: InputDecoration(
                  hintText: 'Enter a message',
                  suffixIcon: const Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 0, 77, 64),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal[900]!),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                )),
          ),
        ],
      ),
      );
      }
    );
  
}
  }
