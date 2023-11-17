import 'package:fitrees_customer/controllers/screensControllers/attendenceScreenController.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/modules/DateTimeConvert.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class attendenceScreen extends StatelessWidget {
  const attendenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(attendenceScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: deviceHeight - 40,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: deviceWidth - 40,
                  height: deviceWidth - 40,
                  decoration: BoxDecoration(
                    color: greyColor,
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 5,
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MobileScanner(
                          controller: controller.qrController,
                          onDetect: (qrCode) {
                            if (controller.qrCode.value == "") {
                              controller.qrCode.value =
                              qrCode.barcodes[0].rawValue!;
                              print(controller.qrCode.value);
                            }
                          },
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            controller.flashLight.value =
                            !controller.flashLight.value;
                            controller.qrController.toggleTorch();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryColor,
                                  width: 2,
                                ),
                                color: backgroundColor.withOpacity(0.25)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Obx(() {
                                return Icon(
                                  controller.flashLight.value
                                      ? Icons.flash_off_rounded
                                      : Icons.flash_on_rounded,
                                  color: primaryColor,
                                  size: 20,
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: deviceWidth - 40,
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(26)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trainer",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontSize: deviceWidth * 0.045,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    "https://img.freepik.com/free-photo/young-attractive-woman-exercising-with-dumbbells-gym_1303-22571.jpg",
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Richard Will",
                                        style: GoogleFonts.openSans(
                                            fontSize: 22,
                                            color: textColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(width: 15),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                            BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 0),
                                          child: Text("4.5",
                                              style: GoogleFonts.openSans(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "High Intensity Training",
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                            color: lightGreyColor, thickness: 2, height: 20),
                        Text(
                          "Date",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontSize: deviceWidth * 0.045,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "${DateTime
                              .now()
                              .day} ${monthToMonthname(DateTime
                              .now()
                              .month)} ${DateTime
                              .now()
                              .year} - ${weekDayToWeekname(DateTime
                              .now()
                              .weekday)}",
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              color: textColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Time",
                          style: GoogleFonts.openSans(
                              color: textColor,
                              fontSize: deviceWidth * 0.045,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          formatTime(DateTime.now()),
                          style: GoogleFonts.openSans(
                            fontSize: 22,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Obx(() {
                  return Visibility(
                    visible: controller.qrCode.value != "",
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.check_box_rounded, color: lemonColor),
                          SizedBox(
                            width: deviceWidth - 100,
                            child: Text(
                              "We have marked your attendance for day, stick to your daily plan and keep eye on notifications",
                              overflow: TextOverflow.visible,
                              style: GoogleFonts.openSans(
                                  color: lemonColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(
                  width: deviceWidth - 120,
                  height: 50,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(48),
                    color: primaryColor,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.back();
                    },
                    padding: EdgeInsets.zero,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      child: Text(
                        "Close",
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
        ),
      ),
    );
  }
}
