import 'package:flutter/material.dart';

class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    super.key,
    required this.label,
    this.onSaved,
  });
  final String label;
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
      onSaved: onSaved,
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
