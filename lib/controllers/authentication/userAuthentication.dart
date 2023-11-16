import 'package:fitrees_customer/controllers/loginScreenController/logInSignUpScreenController.dart';
import 'package:fitrees_customer/views/authenticationScreen/logInSignUpScreen.dart';
import 'package:fitrees_customer/views/userDetailsScreens/userNameDetailsScreen.dart';
import 'package:fitrees_customer/controllers/splashScreenController.dart';
import 'package:fitrees_customer/views/splashScreen/splashScreen.dart';
import 'package:fitrees_customer/models/userUpdateModel.dart';
import 'package:fitrees_customer/models/userDataModel.dart';
import 'package:fitrees_customer/models/apisList.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

late List tokens;
late bool newUser;
late userDataModel userData;

Future<bool> userLogin(String countryCode, String phoneNumber) async {
  final url = Uri.parse(loginOtpApi);

  Map requestBody = {
    "countryCode": countryCode,
    "phoneNumber": phoneNumber,
    "termsAccepted": true
  };

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode(requestBody),
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    if (responseData['message'] == "SMS OTP sent.") {
      newUser = responseData['newUser'];
      return true;
    }
  }

  print(
      'Request $url failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
  return false;
}

Future<void> userLoginPhoneOTP(String verificationOtp) async {
  final url = Uri.parse(loginPhoneOtpApi);

  final requestBody = {
    "countryCode": Get.find<logInSignUpScreenController>().countryCode.value,
    "phoneNumber":
        Get.find<logInSignUpScreenController>().phoneNumberController.text,
    "otp": verificationOtp,
    "source": "CustomerApp"
  };

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode(requestBody),
  );

  final responseData = json.decode(response.body);
  if (response.statusCode == 200) {
    print(userUpdateModel.fromJson(responseData).user!.id);

    tokens = [
      userUpdateModel.fromJson(responseData).refreshToken,
      userUpdateModel.fromJson(responseData).accessToken
    ];
    saveLogin(
      userUpdateModel.fromJson(responseData).user!.id,
      userUpdateModel.fromJson(responseData).refreshToken,
      userUpdateModel.fromJson(responseData).accessToken,
    );

    if (newUser) {
      Get.offAll(const userNameDetailsScreen());
    } else {
      Get.deleteAll();
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.to(const splashScreen());
      });
    }
  } else if (responseData['message'] == 'Invalid OTP.') {
    Get.snackbar("Error", "Entered invalid OTP!",
        backgroundColor: backgroundColor, colorText: textColor);
  }
}

Future<void> fetchUserData(String userId, String authentication) async {
  final Uri url = Uri.parse("$getUserDataApi/$userId");

  final Map<String, String> headers = {
    "accept": "application/json",
    "authorization": authentication,
  };

  final http.Response response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    userData = userDataModel.fromJson(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}\n ${response.body}.');
  }
}

Future<bool> updateUserData(requestBody) async {
  final Uri url = Uri.parse(updateUserDataApi);

  final Map<String, String> headers = {
    "accept": "application/json",
    "authorization": tokens[0],
    "Content-Type": "application/json",
  };

  final String jsonBody = json.encode(requestBody);

  final http.Response response = await http.put(
    url,
    headers: headers,
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print("Profile updated successfully");
    return true;
  }
  print("Failed to update profile. Status code: ${response.statusCode}");
  return false;
}

void saveLogin(userId, refreshToken, accessToken) {
  final box = GetStorage();

  box.write("loggedIn", userId);
  box.write("tokens", [refreshToken, accessToken]);
}

String isLoggedIn() {
  final box = GetStorage();
  return box.read("loggedIn") ?? "newLogIn";
}

bool isNewDevice() {
  final box = GetStorage();
  return box.read("newDevice") ?? true;
}

void signOut() {
  final box = GetStorage();
  box.remove("loggedIn");
  box.remove("tokens");
  Get.deleteAll();
  Future.delayed(const Duration(milliseconds: 100), () {
    Get.to(const logInSignUpScreen());
  });
}
