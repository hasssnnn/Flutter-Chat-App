import 'package:flutter/material.dart';

import '../widgets/bottom_sheet_text_field.dart';
import '../widgets/custom_login_signUp_button.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
    String? email, password;
     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                    height: 600,
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 15),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          BottomSheetTextField(
                            onSaved: (value) {
                              email = value!;
                            },
                            label: 'Email',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BottomSheetTextField(
                            onSaved: (value) {
                              password = value!;
                            },
                            label: 'Password',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CustomLoginAndSignUpButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                }
                              },
                              text: 'Sign Up'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
              });
        },
       
      ),
    );
  }
}
