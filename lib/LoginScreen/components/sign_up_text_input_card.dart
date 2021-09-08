import 'package:flutter/material.dart';

class TextInputWithoutBorder extends StatelessWidget {
  TextInputWithoutBorder({
    required this.obscureText,
    required this.onSaved,
    required this.onChanged,
    this.focusNode,
    this.textInputType,
    this.validator,
    this.hintText,
  });

  final bool obscureText;
  final Function(String?) onSaved;
  final Function(String) onChanged;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        focusNode: focusNode ?? null,
        obscureText: obscureText,
        keyboardType: textInputType,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
