import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newgen/views/home/home_screen.dart';

class SignupCtrl extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final cnicCtrl = TextEditingController();
  final bloodCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  RxBool loading = false.obs;

  Future<void> signup() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty ||
        cnicCtrl.text.isEmpty ||
        bloodCtrl.text.isEmpty ||
        passwordCtrl.text.isEmpty ||
        confirmPasswordCtrl.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (passwordCtrl.text != confirmPasswordCtrl.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      loading.value = true;

      // Firebase Authentication
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );

      // Firestore
      await FirebaseFirestore.instance
          .collection('student')
          .doc(user.user!.uid)
          .set({
        'uid': user.user!.uid,
        'name': nameCtrl.text.trim(),
        'email': emailCtrl.text.trim(),
        'phone': phoneCtrl.text.trim(),
        'cnic': cnicCtrl.text.trim(),
        'bloodGroup': bloodCtrl.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.offAll(() => const HomePage());

    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Signup Error',
        e.message ?? 'Something went wrong',
      );
    } finally {
      loading.value = false;
    }
  }
}