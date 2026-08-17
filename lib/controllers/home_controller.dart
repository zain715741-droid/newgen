import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newgen/views/login/login_page.dart';

class HomeCtrl extends GetxController {
  final box = GetStorage();

  RxInt index = 0.obs;
  RxString userName = ' '.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void changePage(int value) {
    index.value = value;
  }

  Future<void> getUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) return;

    final data = await FirebaseFirestore.instance.collection('student').doc(uid).get();
    userName.value = data['name'] ?? 'User';
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    await box.remove('isLoggedIn');

    Get.offAll(() => LoginPage());
    Get.snackbar('Logout', 'You have been logged out');
  }
}