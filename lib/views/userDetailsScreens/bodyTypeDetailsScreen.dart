import 'package:fitrees_customer/controllers/genderDetailsScreenController.dart';
import 'package:fitrees_customer/views/userDetailsScreens/dobDetailsScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bodyTypeDetailsScreen extends StatelessWidget {
  const bodyTypeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(genderDetailsScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "TELL US ABOUT YOURSELF",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'integralcf',
                  color: textColor,
                  fontSize: deviceWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "To give you a better experience we need to know your body type",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'integralcf',
                    color: textColor,
                    fontSize: deviceWidth * 0.032,
                    height: 1.6,
                  ),
                ),
              ),
              Spacer(),
              Obx(
                () => GestureDetector(
                  onTap: () => controller.selectedGender.value = true,
                  child: CircleAvatar(
                    backgroundColor: controller.selectedGender.value
                        ? primaryColor
                        : lightGreyColor,
                    radius: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/male-icon.svg",
                          height: 60,
                          width: 60,
                          color: controller.selectedGender.value
                              ? backgroundColor
                              : Colors.white,
                        ),
                        Text(
                          "MASCULINE",
                          style: GoogleFonts.openSans(
                            color: controller.selectedGender.value
                                ? backgroundColor
                                : Colors.white,
                            height: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => GestureDetector(
                  onTap: () => controller.selectedGender.value = false,
                  child: CircleAvatar(
                    backgroundColor: controller.selectedGender.value
                        ? lightGreyColor
                        : primaryColor,
                    radius: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/female-icon.svg",
                          height: 60,
                          width: 60,
                          color: controller.selectedGender.value
                              ? Colors.white
                              : backgroundColor,
                        ),
                        Text(
                          "FEMININE",
                          style: GoogleFonts.openSans(
                            color: controller.selectedGender.value
                                ? Colors.white
                                : backgroundColor,
                            height: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(height: 50),
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
                      onPressed: () => Get.to(ageDetailsScreen()),
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
                                  "Next   ",
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
    );
  }
}
