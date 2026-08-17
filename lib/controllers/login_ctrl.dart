import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newgen/views/home/home_screen.dart';

class LoginCtrl extends GetxController {

  final box = GetStorage();

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await box.write('isLoggedIn', true);

      Get.snackbar('Success', 'Login successful');

      Get.offAll(() => const HomePage());

    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password');
      } else {
        Get.snackbar('Error', e.message ?? 'Login failed');
      }

    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}