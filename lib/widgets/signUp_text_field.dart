import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    super.key,
    required this.label,
 this.onChanged,
  });
  final void Function(String)? onChanged;
  final String label;
  String? _validateInput(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Field is required';
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onChanged: onChanged,
      validator: _validateInput,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 2.0),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[500]!)),
          label: Text(
            label,
            style: TextStyle(color: Colors.black.withOpacity(.7)),
          )),
    );
  }
}
