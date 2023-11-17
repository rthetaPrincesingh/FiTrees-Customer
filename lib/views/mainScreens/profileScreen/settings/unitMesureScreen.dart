import 'package:fitrees_customer/controllers/screensControllers/unitMesureScreenController.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class unitMesureScreen extends StatelessWidget {
  const unitMesureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(unitMesureScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: RawMaterialButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        fillColor: lightGreyColor,
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),
                        child: Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.white, size: 20),
                      ),
                    ),
                    Text(
                      "Units of Measure",
                      style: TextStyle(
                          fontFamily: "integralcf",
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
                SizedBox(height: 30),

                horizontalDivider(),

                //Height
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select height",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          hintColorTitle: primaryColor,
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.heightItemSelected.value,
                          dropListModel: controller.heightItemsList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 130,
                          borderColor: lightGreyColor,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.heightItemSelected.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalDivider(),

                //Weight
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select weight",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          hintColorTitle: primaryColor,
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.weightItemSelected.value,
                          dropListModel: controller.weightItemsList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 130,
                          borderColor: lightGreyColor,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.weightItemSelected.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalDivider(),

                //Temperature
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select temperature",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          hintColorTitle: primaryColor,
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected:
                              controller.temperatureItemSelected.value,
                          dropListModel: controller.temperatureItemsList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 90,
                          borderColor: lightGreyColor,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.temperatureItemSelected.value =
                                optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalDivider(),

                //Device
                Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 0, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Devices",
                        style: GoogleFonts.openSans(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Obx(
                        () => SelectDropList(
                          hintColorTitle: primaryColor,
                          arrowColor: primaryColor,
                          containerDecoration: BoxDecoration(
                            color: backgroundColor,
                          ),
                          itemSelected: controller.deviceItemSelected.value,
                          dropListModel: controller.deviceItemsList,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 160,
                          borderColor: lightGreyColor,
                          suffixIcon: Icons.arrow_drop_down,
                          arrowIconSize: 28,
                          paddingDropItem: 10,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          containerPadding:
                              const EdgeInsets.only(left: 0, right: 0),
                          paddingTop: 0,
                          onOptionSelected: (optionItem) {
                            controller.deviceItemSelected.value = optionItem;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Centimeters (Cms)",
                                style: GoogleFonts.openSans(
                                    color: textColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              Obx(() {
                                return SvgPicture.asset(
                                  controller.unitMesureSelected.value
                                      ? "assets/icons/Radio on.svg"
                                      : "assets/icons/Radio off.svg",
                                  width: 20,
                                  height: 20,
                                );
                              }),
                            ],
                          ),
                        ),*/
