import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;

  String? _validateInput(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateInput, // Set the validator function here
      onSaved: onSaved,
      maxLines: maxLines,
      
      decoration: InputDecoration(
        
        // disabledBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
         focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
         ),

      ),
    );
  }
}

