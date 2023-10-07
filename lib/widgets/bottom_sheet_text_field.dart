import 'package:flutter/material.dart';

class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    super.key, required this.label,
  });
final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(
            borderSide:
                BorderSide(
                    color: Colors
                            .grey[
                        400]!,
                    width: 2.0),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Colors.grey[
                          500]!)),
          label:  Text(label, style: TextStyle(color:Colors.black.withOpacity(.7) ),)),
    );
  }
}

