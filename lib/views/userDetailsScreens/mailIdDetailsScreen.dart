import 'package:fitrees_customer/views/userDetailsScreens/bodyTypeDetailsScreen.dart';
import 'package:fitrees_customer/controllers/mailIdDetailsScreenController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mailIdDetailsScreen extends StatelessWidget {
  const mailIdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(mailIdDetailsScreenController());
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            width: deviceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "We hope you are doing great",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'integralcf',
                    color: textColor,
                    fontSize: deviceWidth * 0.052,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "PLEASE ENTER YOUR MAIL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'integralcf',
                      color: textColor,
                      fontSize: deviceWidth * 0.04,
                      height: 1.2,
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Email",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth - 80,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: controller.emailTextController,
                          decoration: InputDecoration(
                            hintText: "Enter your mail (Optional)",
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Colors.white54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          cursorColor: Colors.white,
                          cursorOpacityAnimates: true,
                          cursorWidth: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [
                            AutofillHints.email,
                          ],
                          showCursor: true,
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          validator: (_) {
                            return controller.validateEmail();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: RawMaterialButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        fillColor: lightGreyColor,
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    IntrinsicWidth(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(bodyTypeDetailsScreen());
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
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: Text(
                                    "Next   ",
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/icons/right_arrow.svg",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
