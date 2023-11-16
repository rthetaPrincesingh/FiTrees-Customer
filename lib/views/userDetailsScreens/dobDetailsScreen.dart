import 'package:fitrees_customer/controllers/dobDetailsScreenController.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:fitrees_customer/views/userDetailsScreens/weightDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheel_slider/wheel_slider.dart';

class ageDetailsScreen extends StatelessWidget {
  const ageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int _nInitValue = 0;

    final controller = Get.put(ageDetailsScreenController());
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
                "When were you born ?",
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
              Obx(() {
                return Text(
                  "You are ${(157 - controller.selectedYear.value)} years old",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: textColor,
                    fontSize: deviceWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const Spacer(),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WheelSlider.customWidget(
                      horizontal: false,
                      verticalListHeight: deviceHeight * 0.4,
                      perspective: 0.01,
                      totalCount: 31,
                      initValue: _nInitValue,
                      isInfinite: false,
                      listWidth: 50,
                      verticalListWidth: (deviceWidth / 3) - 50,
                      itemSize: 60,
                      isVibrate: true,
                      onValueChanged: (val) {
                        controller.selectedDate.value = val;
                        controller.checkAge();
                      },
                      showPointer: true,
                      customPointer: SizedBox(
                        height: 80,
                        width: deviceWidth * 0.3,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 3,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            const SizedBox(height: 65),
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
                        controller.getMaxDaysInSelectedMonth(),
                        (index) => Text(
                          (index + 1).toString(),
                          style: GoogleFonts.openSans(
                              fontSize: controller.selectedDate.value == index
                                  ? 30
                                  : 20,
                              fontWeight: controller.selectedDate.value == index
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: Colors.white70,
                              height: 2),
                        ),
                      ),
                    ),
                    WheelSlider.customWidget(
                      horizontal: false,
                      verticalListHeight: deviceHeight * 0.4,
                      perspective: 0.01,
                      totalCount: 12,
                      initValue: _nInitValue,
                      isInfinite: false,
                      listWidth: 50,
                      verticalListWidth: (deviceWidth / 3) - 50,
                      itemSize: 60,
                      isVibrate: true,
                      onValueChanged: (val) {
                        controller.selectedMonth.value = val;
                        controller.checkAge();
                      },
                      allowPointerTappable: true,
                      showPointer: true,
                      customPointer: SizedBox(
                        height: 80,
                        width: deviceWidth * 0.3,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 3,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            const SizedBox(height: 65),
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
                        12,
                        (index) => Text(
                          controller.monthList[index],
                          style: GoogleFonts.openSans(
                              fontSize: controller.selectedMonth.value == index
                                  ? 25
                                  : 20,
                              fontWeight:
                                  controller.selectedMonth.value == index
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                              color: Colors.white70,
                              height: 2.5),
                        ),
                      ),
                    ),
                    WheelSlider.customWidget(
                      allowPointerTappable: true,
                      horizontal: false,
                      verticalListHeight: deviceHeight * 0.4,
                      perspective: 0.01,
                      totalCount: 12,
                      initValue: 139,
                      isInfinite: false,
                      listWidth: 50,
                      verticalListWidth: (deviceWidth / 3) - 50,
                      itemSize: 60,
                      isVibrate: true,
                      onValueChanged: (val) {
                        controller.selectedYear.value = val;
                        controller.checkAge();
                      },
                      showPointer: true,
                      customPointer: SizedBox(
                        height: 80,
                        width: deviceWidth * 0.3,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 3,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            const SizedBox(height: 65),
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
                        150,
                        (index) => Text(
                          (DateTime.now().year - 157 + index).toString(),
                          style: GoogleFonts.openSans(
                              fontSize: controller.selectedYear.value == index
                                  ? 23
                                  : 20,
                              fontWeight: controller.selectedYear.value == index
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: Colors.white70,
                              height: 2.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Obx(() {
                return controller.isValidAge.value ? SizedBox(height: 70,) : Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Invalid Date of Birth!\n( You need to be 8+ years old )",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: Colors.red.shade400,
                      decoration: TextDecoration.none,
                      fontSize: deviceWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IntrinsicWidth(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(48),
                        color: primaryColor,
                        onPressed: () => controller.isValidAge.value
                            ? Get.to(() => const weightDetailsScreen())
                            : Get.snackbar(
                                "Warning", "Please enter valid date of birth",
                                backgroundColor: backgroundColor,
                                colorText: textColor),
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
