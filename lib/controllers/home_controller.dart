import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newgen/views/login/login_page.dart';


class HomeCtrl extends GetxController {
  final box = GetStorage();

  void logout() async {
    await FirebaseAuth.instance.signOut();
    await box.remove('isLoggedIn');

    Get.offAll(() => LoginPage());

    Get.snackbar('Logout', 'You have been logged out');
  }
  RxInt index = 0.obs;

void changePage(int value) {
  index.value = value;
}
}