import 'package:fitrees_customer/controllers/OTPloginScreenController/otpLogInSignUpScreenController.dart';
import 'package:fitrees_customer/controllers/loginScreenController/logInSignUpScreenController.dart';
import 'package:fitrees_customer/controllers/authentication/userAuthentication.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class otpLogInSignUpScreen extends StatelessWidget {
  const otpLogInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(otpLogInSignUpScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: SizedBox(
            width: deviceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: RawMaterialButton(
                    onPressed: () => Get.back(),
                    elevation: 0,
                    fillColor: lightGreyColor,
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder(),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white, size: 20),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "VERIFICATION",
                  style: TextStyle(
                      fontFamily: 'integralcf',
                      color: textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "Check your email. We’ve sent you\nthe PIN at your email.",
                  style: TextStyle(
                      fontFamily: 'integralcf',
                      color: textColor,
                      fontSize: 16,
                      height: 1.3),
                ),
                const SizedBox(height: 50),
                PinFieldAutoFill(
                  autoFocus: true,
                  codeLength: 6,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: true,
                  cursor: Cursor.disabled(),
                  decoration: UnderlineDecoration(
                    hintTextStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    lineStrokeCap: StrokeCap.round,
                    hintText: "●●●●●●",
                    textStyle: TextStyle(fontSize: 20, color: primaryColor),
                    colorBuilder: FixedColorBuilder(primaryColor),
                  ),
                  currentCode: controller.verificationOtp,
                  onCodeChanged: (code) {
                    controller.verificationOtp = code!;
                    if (code.length == 6) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.attemptLoginPhone();
                    }
                  },
                  onCodeSubmitted: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (controller.verificationOtp.isNotEmpty &&
                        controller.verificationOtp.length == 6) {
                      controller.attemptLoginPhone();
                    } else {
                      Get.snackbar("Invalid", "Please enter correct otp!");
                    }
                  },
                ),

                /*
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  fieldWidth: deviceWidth / 6 - 20,
                  numberOfFields: 6,
                  borderColor: lemonColor,
                  focusedBorderColor: lemonColor,
                  // styles: otpTextStyles,
                  showFieldAsBox: false,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  hasCustomInputDecoration: true,
                  decoration: InputDecoration(
                    hintText: "●",
                    hintStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    helperText: "●",
                    counter: const SizedBox.shrink(),
                  ),
                  textStyle: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  onSubmit: (String verificationCode) {
                    controller.verificationOtp = verificationCode;
                  },
                ),*/

                const Spacer(),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (controller.timeLeft.value == 0) {
                            userLogin(
                              Get.find<logInSignUpScreenController>()
                                  .countryCode
                                  .toString(),
                              Get.find<logInSignUpScreenController>()
                                  .phoneNumberController
                                  .text,
                            );
                            controller.timeLeft.value = 59;
                            controller.startCountdownTimer();
                            Get.snackbar(
                                "Success", "OTP is send to your phone again!");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Didn't receive any code? ",
                              style: GoogleFonts.openSans(
                                color: textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                controller.timeLeft.value > 0 &&
                                        controller.timeLeft.value < 10
                                    ? "Retry in 00:0${controller.timeLeft.value.toString()} sec"
                                    : controller.timeLeft.value > 9
                                        ? "Retry in 00:${controller.timeLeft.value.toString()} sec"
                                        : "Resend again",
                                style: GoogleFonts.openSans(
                                  color: lemonColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (controller.verificationOtp.isNotEmpty &&
                              controller.verificationOtp.length == 6) {
                            controller.attemptLoginPhone();
                          } else {
                            Get.snackbar(
                                "Invalid", "Please enter correct otp!");
                          }
                        },
                        padding: EdgeInsets.zero,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: Text(
                              "Verify",
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
