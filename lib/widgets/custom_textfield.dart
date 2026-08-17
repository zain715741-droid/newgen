import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.person_outline;

    if (hintText == 'Email') {
      icon = Icons.email_outlined;
    } else if (hintText == 'Password') {
      icon = Icons.lock_outline;
    } else if (hintText == 'Phone Number') {
      icon = Icons.phone_outlined;
    } else if (hintText == 'CNIC') {
      icon = Icons.badge_outlined;
    } else if (hintText == 'Blood Group') {
      icon = Icons.bloodtype_outlined;
    } else if (hintText == 'Confirm Password') {
      icon = Icons.lock_outline;
    }

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: const Color(0xff667EEA)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xff667EEA),
            width: 2,
          ),
        ),
      ),
    );
  }
}