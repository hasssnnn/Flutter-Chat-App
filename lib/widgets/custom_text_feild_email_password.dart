import 'package:flutter/material.dart';

import 'custom_text_form.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key, required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey[200]!,
      ))),
      child:  CustomTextFormField(
          hintText: hintText),
    );
  }
}

