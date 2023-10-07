import 'package:flutter/material.dart';

import 'bottom_sheet_text_field.dart';
import 'custom_login_button.dart';

Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          height: 600,
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          color: Colors.white,
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom +
                                                  15),
                                          child: const Padding(
                                            padding:  EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                 BottomSheetTextField(label: 'Email',),
                                                 SizedBox(
                                                  height: 16,
                                                ),
                                                 BottomSheetTextField(label: 'Password',),
                                                
                                                 SizedBox(
                                                  height: 24,
                                                ),
                                                 CustomLoginButton(
                                                    text: 'Sign Up'),
                                                 SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      'Have an account? ',
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      'Login',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ));
                                    });
  }

