import 'package:flutter/material.dart';

import 'login_text_form.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText, this.onChanged,
  });

  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey[200]!,
      ))),
      child:  LoginTextFormField(
          hintText: hintText,
          onChanged: onChanged,
          
          ),
    );
  }
}

