import 'package:fitrees_customer/controllers/screensControllers/weightDetailsScreenController.dart';
import 'package:fitrees_customer/views/userDetailsScreens/heightDetailsScreen.dart';
import 'package:fitrees_customer/modules/keyboardDismiss.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class weightDetailsScreen extends StatelessWidget {
  const weightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(weightDetailsScreenController());
    controller.weightText.text = "40.00";
    var key;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                "What’s your weight?",
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
                  "You can always change this later",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'integralcf',
                    color: textColor,
                    fontSize: deviceWidth * 0.032,
                    height: 1.6,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicWidth(
                    child: SizedBox(
                      child: TextField(
                        controller: controller.weightText,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.openSans(
                            fontSize: deviceWidth * 0.14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        onSubmitted: (_){
                          controller.validateAndAdjustWeight();
                        },
                      ),
                    ),
                  ),
                  Text(
                    " kg",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 3.5),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              WheelSlider(
                totalCount: 2400,
                initValue: 300,
                lineColor: primaryColor,
                showPointer: true,
                horizontal: true,
                horizontalListHeight: 100,
                isVibrate: true,
                isInfinite: false,
                customPointer: SizedBox(
                  height: 100,
                  width: 5,
                  child: VerticalDivider(
                    color: primaryColor,
                    width: 80,
                    thickness: 2,
                    endIndent: 25,
                  ),
                ),
                onValueChanged: (val) {
                  controller.selectedWeightDouble.value = val / 10;
                  controller.weightText.text = (val / 10 + 10).toString();
                },
                hapticFeedbackType: HapticFeedbackType.mediumImpact,
              ),
              const SizedBox(height: 50),
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
                      child: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IntrinsicWidth(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Get.to(const heightDetailsScreen());
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
                                    "assets/icons/right_arrow.svg"),
                              ],
                            ),
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
