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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff090B1A),
              Color(0xff151936),
              Color(0xff241B45),
            ],
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [

                // ================= GLOW 1 =================
                Positioned(
                  top: -90,
                  right: -80,
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff7C5CFF).withOpacity(.17),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff7C5CFF).withOpacity(.25),
                          blurRadius: 100,
                          spreadRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),

                // ================= GLOW 2 =================
                Positioned(
                  top: 430,
                  left: -110,
                  child: Container(
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff00D4FF).withOpacity(.09),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff00D4FF).withOpacity(.18),
                          blurRadius: 100,
                          spreadRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),

                // ================= CONTENT =================
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 18,
                  ),

                  child: Column(
                    children: [

                      // ================= TOP BAR =================
                      Row(
                        children: [

                          // Back Button
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },

                            child: Container(
                              width: 45,
                              height: 45,

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.07),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white.withOpacity(.10),
                                ),
                              ),

                              child: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 21,
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Logo
                          Container(
                            width: 45,
                            height: 45,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff7C5CFF),
                                  Color(0xff4D8DFF),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff7C5CFF)
                                      .withOpacity(.30),
                                  blurRadius: 18,
                                  offset: const Offset(0, 7),
                                ),
                              ],
                            ),

                            child: const Icon(
                              Icons.forum_rounded,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // ================= HEADING =================
                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          'Create Your\nAccount ✨',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            height: 1.08,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.8,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          'Create an account and start connecting\nwith your friends and family.',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ================= FORM CARD =================
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(21),

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.075),
                          borderRadius: BorderRadius.circular(30),

                          border: Border.all(
                            color: Colors.white.withOpacity(.12),
                            width: 1,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.25),
                              blurRadius: 35,
                              offset: const Offset(0, 18),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            // ================= CARD TITLE =================
                            Row(
                              children: [

                                Container(
                                  width: 40,
                                  height: 40,

                                  decoration: BoxDecoration(
                                    color: const Color(0xff7C5CFF)
                                        .withOpacity(.18),
                                    borderRadius: BorderRadius.circular(13),
                                  ),

                                  child: const Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: Color(0xffA994FF),
                                    size: 21,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                const Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),

                                    SizedBox(height: 2),

                                    Text(
                                      'Fill in your details below',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // ================= NAME =================
                            _label('FULL NAME'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.nameCtrl,
                              hintText: 'Enter your name',
                            ),

                            const SizedBox(height: 17),

                            // ================= EMAIL =================
                            _label('EMAIL ADDRESS'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.emailCtrl,
                              hintText: 'Enter your email',
                              keyboardType:
                                  TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 17),

                            // ================= PHONE =================
                            _label('PHONE NUMBER'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.phoneCtrl,
                              hintText: 'Enter your phone number',
                              keyboardType: TextInputType.phone,
                            ),

                            const SizedBox(height: 17),

                            // ================= CNIC =================
                            _label('CNIC'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.cnicCtrl,
                              hintText: 'Enter your CNIC',
                              keyboardType: TextInputType.number,
                            ),

                            const SizedBox(height: 17),

                            // ================= BLOOD =================
                            _label('BLOOD GROUP'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.bloodCtrl,
                              hintText: 'Enter blood group',
                            ),

                            const SizedBox(height: 17),

                            // ================= PASSWORD =================
                            _label('PASSWORD'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.passwordCtrl,
                              hintText: 'Create a password',
                              obscureText: true,
                            ),

                            const SizedBox(height: 17),

                            // ================= CONFIRM =================
                            _label('CONFIRM PASSWORD'),

                            const SizedBox(height: 8),

                            CustomTextField(
                              controller: ctrl.confirmPasswordCtrl,
                              hintText: 'Confirm your password',
                              obscureText: true,
                            ),

                            const SizedBox(height: 27),

                            // ================= CREATE BUTTON =================
                            SizedBox(
                              width: double.infinity,
                              height: 59,

                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff7C5CFF),
                                      Color(0xff4D8DFF),
                                    ],
                                  ),

                                  borderRadius:
                                      BorderRadius.circular(18),

                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff7C5CFF)
                                          .withOpacity(.30),
                                      blurRadius: 22,
                                      offset: const Offset(0, 9),
                                    ),
                                  ],
                                ),

                                child: ElevatedButton(
                                  onPressed: ctrl.signup,

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.transparent,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shadowColor: Colors.transparent,

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18),
                                    ),
                                  ),

                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,

                                    children: [

                                      Text(
                                        'Create Account',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 21,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 22),

                            // ================= DIVIDER =================
                            Row(
                              children: [

                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color:
                                        Colors.white.withOpacity(.10),
                                  ),
                                ),

                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),

                                  child: Text(
                                    'ALREADY A MEMBER?',
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color:
                                        Colors.white.withOpacity(.10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 17),

                            // ================= LOGIN BUTTON =================
                            SizedBox(
                              width: double.infinity,
                              height: 52,

                              child: OutlinedButton(
                                onPressed: () {
                                  Get.back();
                                },

                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,

                                  side: BorderSide(
                                    color:
                                        Colors.white.withOpacity(.16),
                                  ),

                                  backgroundColor:
                                      Colors.white.withOpacity(.035),

                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(17),
                                  ),
                                ),

                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,

                                  children: [

                                    Icon(
                                      Icons.login_rounded,
                                      size: 19,
                                    ),

                                    SizedBox(width: 9),

                                    Text(
                                      'Already have an account? Login',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      // ================= SECURITY =================
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.verified_user_rounded,
                            color: Colors.white.withOpacity(.32),
                            size: 14,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            'Your information is kept secure',
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(.32),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= FIELD LABEL =================
  static Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}