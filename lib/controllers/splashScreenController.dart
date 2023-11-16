import 'package:fitrees_customer/controllers/authentication/userAuthentication.dart';
import 'package:fitrees_customer/views/authenticationScreen/logInSignUpScreen.dart';
import 'package:fitrees_customer/views/mainScreens/bottomNavigationBar.dart';
import 'package:fitrees_customer/views/onboardingScreen/onboardingScreen.dart';
import 'package:fitrees_customer/views/userDetailsScreens/userNameDetailsScreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

late bool isnewDevice;
late String isLoggedin;

class splashScreenController extends GetxController {
  @override
  void onInit() {
    checkStatus();
    super.onInit();
  }

  checkStatus() async {
    isLoggedin = isLoggedIn();
    isnewDevice = isNewDevice();
    if (isLoggedin != "newLogIn") {
      final box = GetStorage();
      tokens = box.read("tokens") ?? [];
      fetchUserData(isLoggedin, tokens[0]);
    }
    splashScreenLoader();
  }

  void splashScreenLoader() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.delete<splashScreenController>();
        if (isLoggedin != "newLogIn") {
          if (userData.firstName == "User") {
            Get.offAll(const userNameDetailsScreen());
          } else {
            Get.offAll(const bottomNavigationBar());
          }
        } else {
          if (isnewDevice) {
            Get.offAll(const onboardingScreen());
          } else {
            Get.offAll(const logInSignUpScreen());
          }
        }
      },
    );
  }
}
