import 'package:chat/cubits/login/login_cubit.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/services/sign_in_google.dart';
import 'package:chat/widgets/custom_login_signUp_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_google_button.dart';
import '../widgets/login_text_field.dart';
import '../widgets/snack_bar.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static String id = 'LoginPage';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.teal[900]!,
                      Colors.teal[600]!,
                      Colors.teal[200]!
                    ],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Welcome Again',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
                                              color: Color.fromRGBO(
                                                  225, 95, 27, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        CustomTextField(
                                            hintText: 'Email',
                                            onChanged: (value) =>
                                                email = value),
                                        CustomTextField(
                                            hintText: 'Password',
                                            onChanged: (value) =>
                                                password = value),
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        CustomLoginAndSignUpButton(
                                            onTap: () {
                                              BlocProvider.of<LoginCubit>(
                                                      context)
                                                  .loginUser(
                                                      email: email!,
                                                      password: password!);
                                            },
                                            text: 'Login'),
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
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, SignUpPage.id);
                                              },
                                              child: const Text(
                                                "Sign Up?",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
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
                                         CustomGoogleButton(
                                          onTap: ()async => await signInWithGoogle() ,
                                         ),
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
          ),
        );
      },
    );
  }
}
