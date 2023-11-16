import 'package:fitrees_customer/controllers/mailIdDetailsScreenController.dart';
import 'package:fitrees_customer/controllers/userNameDetailsScreenController.dart';
import 'package:fitrees_customer/views/splashScreen/splashScreen.dart';
import 'authentication/userAuthentication.dart';
import 'package:get/get.dart';

class activityLevelDetailsScreenController extends GetxController {
  RxList<String> activityList = [
    "Rookie",
    "Beginner",
    "Intermediate",
    "Advance",
    "True Beast",
  ].obs;
  RxInt selectedActivityListIndex = 2.obs;

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

    /*final Map<String, dynamic> requestBody = {
      "profile": {
        "firstName": firstName,
        "lastName": lastName,
      },
    };*/

    // final String email = Get.find<mailIdDetailsScreenController>().emailTextController.text;

    final Map<String, dynamic> profileData = {
      "firstName": firstName,
      "lastName": lastName,
    };

    /*if (email.isNotEmpty) {
      profileData["email"] = email;
    }*/

    final Map<String, dynamic> requestBody = {
      "profile": profileData,
    };

    if (await updateUserData(requestBody)) {
      Get.deleteAll();
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.to(const splashScreen());
      });
    } else {
      Get.snackbar("Error", 'Some error occurred! Try again later.');
    }
  }
}
