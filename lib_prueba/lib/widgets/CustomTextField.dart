import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String Placeholder;
  final bool isPassword;
  final TextInputType typeKB;
  final TextEditingController cnt;

  const CustomTextField(
    {
      super.key,
      required this.Placeholder,
      this.typeKB  = TextInputType.text,
      required this.cnt,
      this.isPassword = false
    
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
       controller: cnt,
       obscureText: isPassword,
       keyboardType: typeKB,
       decoration: InputDecoration(
          labelText: Placeholder
       ),
    );
  }
}