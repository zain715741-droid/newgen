// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/controllers/login_ctrl.dart';
import 'package:newgen/views/signup/signup_screen.dart';
import 'package:newgen/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  final LoginCtrl ctrl = Get.put(LoginCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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

                // ================= GLOWING CIRCLE 1 =================
                Positioned(
                  top: -80,
                  right: -70,
                  child: Container(
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff7C5CFF).withOpacity(.18),
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

                // ================= GLOWING CIRCLE 2 =================
                Positioned(
                  top: 250,
                  left: -100,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff00D4FF).withOpacity(.10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff00D4FF).withOpacity(.20),
                          blurRadius: 100,
                          spreadRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),

                // ================= MAIN CONTENT =================
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [

                      const SizedBox(height: 25),

                      // ================= BRAND =================
                      Row(
                        children: [

                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff7C5CFF),
                                  Color(0xff4D8DFF),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff7C5CFF).withOpacity(.35),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.forum_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),

                          const SizedBox(width: 13),

                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NewGen',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: .3,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Connect • Chat • Share',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ================= HEADING =================
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome\nBack 👋',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            height: 1.08,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.8,
                          ),
                        ),
                      ),

                      const SizedBox(height: 13),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in to continue your conversations\nand stay connected with your people.',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // ================= LOGIN GLASS CARD =================
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22),
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

                            // Card heading
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
                                    Icons.lock_open_rounded,
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
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Enter your account details',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 27),

                            // ================= EMAIL =================
                            const Text(
                              'EMAIL ADDRESS',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),

                            const SizedBox(height: 9),

                            CustomTextField(
                              controller: emailCtrl,
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 19),

                            // ================= PASSWORD =================
                            const Text(
                              'PASSWORD',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),

                            const SizedBox(height: 9),

                            CustomTextField(
                              controller: passwordCtrl,
                              hintText: 'Enter your password',
                              obscureText: true,
                            ),

                            const SizedBox(height: 26),

                            // ================= LOGIN BUTTON =================
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
                                  borderRadius: BorderRadius.circular(18),
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
                                  onPressed: () {
                                    ctrl.login(
                                      emailCtrl.text,
                                      passwordCtrl.text,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        'Continue',
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

                            const SizedBox(height: 23),

                            // ================= OR =================
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.white.withOpacity(.10),
                                  ),
                                ),

                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.white.withOpacity(.10),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 21),

                            // ================= SIGNUP =================
                            SizedBox(
                              width: double.infinity,
                              height: 53,
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.to(() => const Signup());
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.white.withOpacity(.16),
                                  ),
                                  backgroundColor:
                                      Colors.white.withOpacity(.035),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [

                                    Icon(
                                      Icons.person_add_alt_1_rounded,
                                      size: 19,
                                    ),

                                    SizedBox(width: 9),

                                    Text(
                                      'Create New Account',
                                      style: TextStyle(
                                        fontSize: 14,
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

                      const SizedBox(height: 25),

                      // ================= BOTTOM INFO =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(
                            Icons.shield_rounded,
                            color: Colors.white.withOpacity(.35),
                            size: 14,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            'Your conversations are secure',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.35),
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
}