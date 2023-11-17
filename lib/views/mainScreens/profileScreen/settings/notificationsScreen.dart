import 'package:fitrees_customer/controllers/screensControllers/appNotificationScreenController.dart';
import 'package:fitrees_customer/modules/horizontalDivider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class appNotificationScreen extends StatelessWidget {
  const appNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(appNotificationScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: deviceHeight - 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "NOTIFICATIONS",
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

                  //Workout Reminders
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => controller.workoutReminder.value =
                        !controller.workoutReminder.value,
                    //Get.to(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 5, bottom: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Workout Reminders",
                            style: GoogleFonts.openSans(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Obx(() {
                            return AnimatedContainer(
                              alignment: controller.workoutReminder.value
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeIn,
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: controller.workoutReminder.value
                                      ? primaryColor
                                      : lightGreyColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: controller.workoutReminder.value ? Offset(-4, 0) : Offset(4, 0),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: controller.workoutReminder.value ? Colors.black : Colors.white,
                                    radius: 13,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  horizontalDivider(),

                  //Program Notifications
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => controller.programReminder.value =
                        !controller.programReminder.value,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 5, left: 5, bottom: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Program Notifications",
                            style: GoogleFonts.openSans(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Obx(() {
                            return AnimatedContainer(
                              alignment: controller.programReminder.value
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeIn,
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: controller.programReminder.value
                                      ? primaryColor
                                      : lightGreyColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: controller.programReminder.value ? Offset(-4, 0) : Offset(4, 0),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: controller.programReminder.value ? Colors.black : Colors.white,
                                    radius: 13,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  horizontalDivider(),

                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: RichText(
                      text: TextSpan(
                          text:
                              "You can manage your app notification permission in your ",
                          style: GoogleFonts.openSans(color: textColor, fontSize: 13, fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "Phone Settings",
                            style: GoogleFonts.openSans(color: lemonColor, fontSize: 13, fontWeight: FontWeight.w400),
                          )
                        ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
