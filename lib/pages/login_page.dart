import 'package:chat/widgets/custom_login_signUp_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_google_button.dart';
import '../widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String id = 'LoginPage';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.teal[900]!, Colors.teal[600]!, Colors.teal[200]!],
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome Again',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(225, 95, 27, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              const CustomTextField(
                                hintText: 'Email',
                              ),
                              const CustomTextField(
                                hintText: 'Password',
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const CustomLoginAndSignUpButton(text: 'Login'),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  const Text(
                                    "Sign Up?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                "Continue with google account",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const CustomGoogleButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
