import 'package:fitrees_customer/controllers/screensControllers/activityLevelDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/bodyTypeDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/userNameDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/heightDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/goalDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/dobDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/screensControllers/weightDetailsScreenController.dart';
import 'package:fitrees_customer/views/userDetailsScreens/mailVerificationScreen.dart';
import 'package:fitrees_customer/views/splashScreen/splashScreen.dart';
import '../apiController/userAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mailIdDetailsScreenController extends GetxController {
  TextEditingController emailTextController = TextEditingController();

  RegExp emailRegExp =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  String? validateEmail() {
    if (emailTextController.text.isNotEmpty &&
        !emailRegExp.hasMatch(emailTextController.text)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String firstName = "User";
  String lastName = "User";

  void updateData() async {
    if (Get.find<userNameDetailsScreenController>()
        .firstNameTextController
        .text
        .trim()
        .contains(" ")) {
      firstName = Get.find<userNameDetailsScreenController>()
          .firstNameTextController
          .text
          .split(" ")[0];
    } else {
      firstName = Get.find<userNameDetailsScreenController>()
          .firstNameTextController
          .text
          .trim();
    }

    if (Get.find<userNameDetailsScreenController>()
        .lastNameTextController
        .text
        .trim()
        .contains(" ")) {
      lastName = Get.find<userNameDetailsScreenController>()
          .lastNameTextController
          .text
          .split(" ")[0];
    } else {
      lastName = Get.find<userNameDetailsScreenController>()
          .lastNameTextController
          .text
          .trim();
    }

    final Map<String, dynamic> profileData = {
      "firstName": firstName,
      "lastName": lastName,
      "bodyType": Get.find<genderDetailsScreenController>().selectedGender.value
          ? "Masculine"
          : "Feminine",
      "dob":
          Get.find<dobDetailsScreenController>().dateOfBirth.toIso8601String(),
      "weight": double.parse(
          Get.find<weightDetailsScreenController>().weightText.text),
      "height":
          90 + Get.find<heightDetailsScreenController>().selectedHeight.value,
      "goal": Get.find<goalDetailsScreenController>().goalList[
          Get.find<goalDetailsScreenController>().selectedGoalListIndex.value],
      "activityLevel":
          Get.find<activityLevelDetailsScreenController>().activityList[
              Get.find<activityLevelDetailsScreenController>()
                  .selectedActivityListIndex
                  .value]
    };

    if (emailTextController.text.isNotEmpty) {
      profileData["email"] = emailTextController.text;
    }

    final Map<String, dynamic> requestBody = {
      "profile": profileData,
    };

    print(requestBody);

    if (await updateUserData(requestBody)) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () async{
          if (emailTextController.text.isNotEmpty) {
            String token = await verifyEmail(emailTextController.text);
            Get.to(mailVerificationScreen(token: token.toString()));
          } else {
            Get.deleteAll();
            Get.to(const splashScreen());
          }
        },
      );
    } else {
      Get.snackbar("Error", 'Some error occurred! Try again later.');
    }
  }
}
