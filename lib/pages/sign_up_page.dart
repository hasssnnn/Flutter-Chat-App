import 'package:chat/cubits/signUp_cubit/sign_up_cubit.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/signUp_text_field.dart';
import '../widgets/custom_login_signUp_button.dart';
import 'chat_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  String? email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  static String id = 'SignUpPage';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is SignUpFailure) {
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 100),
                          const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SignUpTextField(
                            onChanged: (value) => email = value,
                            label: 'Email',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SignUpTextField(
                            onChanged: (value) => password = value,
                            label: 'Password',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomLoginAndSignUpButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<SignUpCubit>(context).signUpUser(
                                      email: email!, password: password!);
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                }
                              },
                              text: 'Sign Up'),
                          const SizedBox(
                            height: 16,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have an account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child:const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ));
      },
    );
  }
}
