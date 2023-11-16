import 'dart:developer';

import 'package:fitrees_customer/controllers/loginScreenController/logInSignUpScreenController.dart';
import 'package:fitrees_customer/views/authenticationScreen/otpLogInSignUpScreen.dart';
import 'package:fitrees_customer/modules/textWidth.dart';
import 'package:country_picker/country_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class logInSignUpScreen extends StatelessWidget {
  const logInSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(logInSignUpScreenController());
    const loginText = "Login";
    // const signUpText = "Sign Up";

    double loginTextWidth = getTextWidth(
      loginText,
      GoogleFonts.openSans(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
    );

    /*double signUpTextWidth = getTextWidth(
      signUpText,
      GoogleFonts.openSans(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
    );*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: deviceWidth,
                  height: deviceHeight - 350,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.black26,
                          Colors.transparent
                        ],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(
                      "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fitness-gym-design-template-5114f87408daf947703854487f2decb7_screen.jpg?ts=1595350530",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Obx(
                    () => SizedBox(
                      width: deviceWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedOption.value = true;
                            },
                            child: SizedBox(
                              width: loginTextWidth + 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    loginText,
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 2,
                                    width: controller.selectedOption.value
                                        ? loginTextWidth + 5
                                        : 0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          /*
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              controller.selectedOption.value = false;
                            },
                            child: SizedBox(
                              width: signUpTextWidth + 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    signUpText,
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 2,
                                    width: controller.selectedOption.value
                                        ? 0
                                        : signUpTextWidth + 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: primaryColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                          */
                          const Spacer(),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.transparent,
                            padding: const EdgeInsets.all(5),
                            shape: const CircleBorder(
                              side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.white,
                              ),
                            ),
                            child: Image.asset(
                              "assets/logo.png",
                              height: 40,
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME TO",
                        style: GoogleFonts.lalezar(
                          color: textColor,
                          fontSize: deviceWidth * 0.1,
                          height: 1.2,
                        ),
                      ),
                      Image.asset(
                        "assets/logo-full.png",
                        color: Colors.white,
                        width: deviceWidth * 0.48,
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            showCountryPicker(
                              showPhoneCode: true,
                              favorite: ["IN"],
                              context: context,
                              showSearch: true,
                              useSafeArea: true,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                                bottomSheetHeight: deviceHeight / 1.5,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                  labelText: 'Search',
                                  labelStyle: TextStyle(color: backgroundColor),
                                  hintText: 'Enter your country name',
                                  prefixIcon: Icon(Icons.search,
                                      color: backgroundColor),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) => controller
                                  .countryCode.value = "+${country.phoneCode}",
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_drop_down_rounded,
                                  color: Colors.white),
                              Obx(() {
                                return Text(
                                  controller.countryCode.value,
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      height: 1.8),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: deviceWidth - 150,
                          child: PhoneFieldHint(
                            child: TextField(
                              // readOnly: true,
                              controller: controller.phoneNumberController,
                              focusNode: controller.focusNode,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                hintText: '9876543210',
                                hintStyle: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: Colors.white30,
                                    fontWeight: FontWeight.w400),
                                labelStyle: GoogleFonts.openSans(
                                  fontSize: 20,
                                  color: controller.focusNode.hasFocus ||
                                          !controller.isTextFieldEmpty.value
                                      ? Colors.orange
                                      : Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: const EdgeInsets.only(left: 5),
                                counterText: "",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: lightGreyColor, width: 2),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: lightGreyColor, width: 2),
                                ),
                              ),
                              cursorColor: Colors.white,
                              cursorOpacityAnimates: true,
                              cursorWidth: 1,
                              autofillHints: const [
                                AutofillHints.telephoneNumber,
                              ],
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              showCursor: true,
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),

                              onChanged: (value) {
                                controller.isTextFieldEmpty.value =
                                    value.isEmpty;
                                if (controller.valuedChange) {
                                  controller.countryCode.value = "+91";
                                }
                              },
                              onTapOutside: (_) {
                                controller.focusNode.unfocus();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Obx(() {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.isTermsChecked.value =
                    !controller.isTermsChecked.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      controller.isTermsChecked.value
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color: controller.isTermsChecked.value
                          ? lemonColor
                          : Colors.white,
                      size: 25,
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: deviceWidth - 100,
                      child: RichText(
                        text: TextSpan(
                          text: "By clicking on the button below you agree to ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            height: 1.3,
                            color: controller.isTermsChecked.value
                                ? textColor
                                : Colors.red,
                            decoration: TextDecoration.none,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'terms and conditions',
                              style: TextStyle(
                                color: controller.isTermsChecked.value
                                    ? lemonColor
                                    : Colors.red,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  String url = 'https://fitrees.com/legal/tnc';
                                  Uri uri = Uri.parse(url);
                                  if (await canLaunch(uri.toString())) {
                                    await launch(
                                      uri.toString(),
                                      /*forceWebView: true,
                                      forceSafariVC: true,
                                      enableJavaScript: true,*/
                                    );
                                  }
                                },
                            ),
                            const TextSpan(text: ', '),
                            TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(
                                color: controller.isTermsChecked.value
                                    ? lemonColor
                                    : Colors.red,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  String url = 'https://fitrees.com/legal/pp';
                                  Uri uri = Uri.parse(url);
                                  if (await canLaunch(uri.toString())) {
                                    await launch(
                                      uri.toString(),
                                      /*forceWebView: true,
                                      forceSafariVC: true,
                                      enableJavaScript: true,*/
                                    );
                                  }
                                },
                            ),
                            const TextSpan(text: ', and our all other '),
                            TextSpan(
                              text: 'policies',
                              style: TextStyle(
                                color: controller.isTermsChecked.value
                                    ? lemonColor
                                    : Colors.red,
                                decoration: TextDecoration.none,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  String url = 'https://fitrees.com/legal';
                                  Uri uri = Uri.parse(url);
                                  if (await canLaunch(uri.toString())) {
                                    await launch(
                                      uri.toString(),
                                      /*forceWebView: true,
                                      forceSafariVC: true,
                                      enableJavaScript: true,*/
                                    );
                                  }
                                },
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Social Media Login
                  /*SizedBox(
                    height: 60,
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 0,
                      fillColor: lightGreyColor,
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                      child: const FaIcon(Icons.apple_outlined,
                          color: Colors.white, size: 35),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 5,
                      fillColor: lightGreyColor,
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                      child: Image.network(
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  const Spacer(),*/

                  //LogIn button
                  IntrinsicWidth(
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(48),
                      color: primaryColor,
                      onPressed: () async {
                        final phoneNumber =
                            controller.phoneNumberController.text;
                        if (controller.isTermsChecked.value) {
                          if (controller.isPhoneNumberValid(phoneNumber)) {
                            print('Valid number');
                            await controller.attemptLogin()
                                ? {
                                    Get.snackbar("Success", "OTP is sent!",
                                        backgroundColor: backgroundColor,
                                        colorText: textColor),
                                    Get.to(
                                      const otpLogInSignUpScreen(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 500),
                                    )
                                  }
                                : Get.snackbar(
                                    "Error",
                                    "Something went wrong!",
                                    backgroundColor: backgroundColor,
                                    colorText: textColor,
                                  );
                          } else {
                            Get.snackbar(
                              "Error",
                              "Invalid phone number!",
                              backgroundColor: backgroundColor,
                              colorText: textColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Warning",
                            "You need to agree the terms and conditions to proceed!",
                            backgroundColor: backgroundColor,
                            colorText: textColor,
                          );
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Text(
                                  "Login   ",
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SvgPicture.asset("assets/icons/right_arrow.svg"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
