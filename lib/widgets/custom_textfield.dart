import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
 final String text;
 final TextEditingController controller;
 final bool? obscureText;
 final TextInputType keyboardType;
 final String? Function(String?)? validator;
 final String hintText;
 final Widget? suffixIcon;
 final Widget? prefixIcon;
 final String? obscuringCharacter;


  const CustomTextField({ 
    super.key, required this.text, required this.controller, this.obscureText, required this.keyboardType, this.validator, required this.hintText, this.suffixIcon, this.prefixIcon, this.obscuringCharacter, 
  
});

  @override
  Widget build(BuildContext context) {
    return TextFormField (
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      obscuringCharacter: obscuringCharacter ?? '*',
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),


    );
  }
}