import 'package:fitrees_customer/views/authenticationScreen/logInSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class onboardingScreenController extends GetxController{
  final pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;

  gotoLogInScreen(){
    final box = GetStorage();
    box.write("newDevice", false);
    Get.offAll(const logInSignUpScreen());
  }
}