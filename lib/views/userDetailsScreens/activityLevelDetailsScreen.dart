import 'package:fitrees_customer/controllers/activityLevelDetailsScreenController.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class activityLevelDetailsScreen extends StatelessWidget {
  const activityLevelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int _nTotalCount = 5;
    final int _nInitValue = 2;

    final controller = Get.put(activityLevelDetailsScreenController());
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
                "Your regular physical activity level?",
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
                  verticalListHeight: deviceHeight * 0.55,
                  perspective: 0.01,
                  totalCount: _nTotalCount,
                  initValue: _nInitValue,
                  isInfinite: false,
                  listWidth: 500,
                  verticalListWidth: 500,
                  itemSize: 50,
                  isVibrate: true,
                  onValueChanged: (val) {
                    controller.selectedActivityListIndex.value = val;
                  },
                  showPointer: true,
                  customPointer: SizedBox(
                    height: 70,
                    width: deviceWidth - 140,
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
                        const SizedBox(height: 55),
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
                    controller.activityList.length,
                    (index) => Text(
                      controller.activityList[index],
                      style: GoogleFonts.openSans(
                        fontSize: (controller.selectedActivityListIndex.value ==
                                        index &&
                                    _nInitValue == index) ||
                                controller.selectedActivityListIndex.value ==
                                    index
                            ? 28
                            : 24,
                        fontWeight: (controller
                                            .selectedActivityListIndex.value ==
                                        index &&
                                    _nInitValue == index) ||
                                controller.selectedActivityListIndex.value ==
                                    index
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
                        onPressed: () => controller.updateData(),
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
