// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/controllers/signup_ctrl.dart';
import 'package:newgen/widgets/custom_textfield.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SignupCtrl());

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Top Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 35,
                  bottom: 30,
                ),

                decoration: const BoxDecoration(
                  color: Color(0xff667EEA),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),

                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.person_add_rounded,
                        size: 42,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Join us and start chatting',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [

                    CustomTextField(
                      controller: ctrl.nameCtrl,
                      hintText: 'Name',
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.emailCtrl,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.phoneCtrl,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.cnicCtrl,
                      hintText: 'CNIC',
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.bloodCtrl,
                      hintText: 'Blood Group',
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.passwordCtrl,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 14),

                    CustomTextField(
                      controller: ctrl.confirmPasswordCtrl,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: ctrl.signup,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff667EEA),
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: Color(0xff667EEA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}