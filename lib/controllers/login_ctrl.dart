import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginCtrl extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    // Perform login logic here
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}