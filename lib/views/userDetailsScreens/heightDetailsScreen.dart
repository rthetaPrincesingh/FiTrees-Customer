import 'package:fitrees_customer/views/userDetailsScreens/goalDetailsScreen.dart';
import 'package:fitrees_customer/controllers/heightDetailsScreenController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class heightDetailsScreen extends StatelessWidget {
  const heightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int _nTotalCount = 115;
    final int _nInitValue = 74;

    final controller = Get.put(heightDetailsScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "What’s your height?",
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
                  "This helps us create your personalized plan",
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
              Obx(
                () => WheelSlider.customWidget(
                  horizontal: false,
                  verticalListHeight: deviceHeight * 0.5,
                  perspective: 0.01,
                  totalCount: _nTotalCount,
                  initValue: _nInitValue,
                  isInfinite: false,
                  listWidth: 500,
                  verticalListWidth: 500,
                  itemSize: 74,
                  isVibrate: true,
                  onValueChanged: (val) {
                    controller.selectedHeight.value = val;
                  },
                  showPointer: true,
                  customPointer: SizedBox(
                    height: 85,
                    width: deviceWidth * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 3,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "cm",
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 3,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                  children: List.generate(
                    161,
                    (index) => Text(
                      (index + 90).toString(),
                      style: GoogleFonts.openSans(
                        fontSize:
                            controller.selectedHeight.value == index ? 55 : 50,
                        fontWeight: controller.selectedHeight.value == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ),
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
                      child: const Icon(Icons.arrow_back_rounded,
                          color: Colors.white, size: 20,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IntrinsicWidth(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () => Get.to(goalDetailsScreen()),
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
