import 'package:firebase_auth/firebase_auth.dart';

void signOutUser() async {
  await FirebaseAuth.instance.signOut();
}
