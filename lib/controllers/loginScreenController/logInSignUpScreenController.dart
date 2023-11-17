import 'package:fitrees_customer/controllers/apiController/userAuthentication.dart';
import 'package:fitrees_customer/modules/countryCodeList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class logInSignUpScreenController extends GetxController {
  RxBool selectedOption = true.obs;
  RxBool isTextFieldEmpty = true.obs;
  RxBool isTermsChecked = true.obs;
  FocusNode focusNode = FocusNode();

  bool valuedChange = false;

  TextEditingController phoneNumberController = TextEditingController();
  List<String> result = [];

  RxString countryCode = "+91".obs;

  @override
  void onInit() {
    phoneNumberController.addListener(() {
      if(phoneNumberController.text.isNotEmpty && !valuedChange){
        result = splitCountryCodeAndPhoneNumber(phoneNumberController.text);
        print(result);
        valuedChange = true;
        countryCode.value = result[0];
        phoneNumberController.text = result[1];
      }else{
        phoneNumberController.removeListener((){});
      }
    });
    super.onInit();
  }


  bool isPhoneNumberValid(String phoneNumber) {
    final validPattern1 = RegExp(r'^(\d{10,})$');
    return validPattern1.hasMatch(phoneNumber);
  }

  Future<bool> attemptLogin() async {
    print(countryCode.value + phoneNumberController.text);
    return userLogin(countryCode.value, phoneNumberController.text);
  }
}
