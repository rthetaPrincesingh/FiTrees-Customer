import 'package:fitrees_customer/controllers/notificationScreenController.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class notificationScreen extends StatelessWidget {
  const notificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(notificationScreenController());
    return SafeArea(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "NOTIFICATION",
              style: TextStyle(
                  fontFamily: "integralcf",
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: 40,
                width: deviceWidth - 40,
                decoration: BoxDecoration(
                  color: lightGreyColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Obx(() {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.selectedNotificationType.value = 0,
                        child: Container(
                          height: 40,
                          width: (deviceWidth - 40) / 3,
                          decoration: BoxDecoration(
                            color:
                                controller.selectedNotificationType.value == 0
                                    ? primaryColor
                                    : lightGreyColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(
                              "New",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color:
                                    controller.selectedNotificationType.value ==
                                            0
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.selectedNotificationType.value = 1,
                        child: Container(
                          height: 40,
                          width: (deviceWidth - 40) / 3,
                          decoration: BoxDecoration(
                            color:
                                controller.selectedNotificationType.value == 1
                                    ? primaryColor
                                    : lightGreyColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(
                              "Events",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color:
                                    controller.selectedNotificationType.value ==
                                            1
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.selectedNotificationType.value = 2,
                        child: Container(
                          height: 40,
                          width: (deviceWidth - 40) / 3,
                          decoration: BoxDecoration(
                            color:
                                controller.selectedNotificationType.value == 2
                                    ? primaryColor
                                    : lightGreyColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Text(
                              "All",
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color:
                                    controller.selectedNotificationType.value ==
                                            2
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Expanded(
              child: Obx(() {
                return controller.tempNotificationList.length != 0 ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/notification.svg", height: 40, width: 40),
                      Text("No new notifications!", style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 2.5
                      )),
                    ],
                  ),
                ) : ListView.builder(
                  itemCount: controller.tempNotificationList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(0),
                      closeOnScroll: true,
                      startActionPane: ActionPane(
                        extentRatio: 1 / 5,
                        motion: ScrollMotion(),
                        dragDismissible: false,
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              List temp = controller.tempNotificationList[index];
                              temp[0] = true;
                              controller.tempNotificationList[index]= temp;
                            },
                            backgroundColor: lemonColor,
                            foregroundColor: Colors.white,
                            icon: Icons.check_box,
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        extentRatio: 1 / 5,
                        dragDismissible: false,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) =>
                                controller.removeFromList(index),
                            backgroundColor: redColor,
                            foregroundColor: Colors.white,
                            icon: FontAwesomeIcons.trash,
                            autoClose: true,
                            // label: 'Done',
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                              thickness: 0.5,
                              color: lightGreyColor,
                              indent: 25,
                              endIndent: 25,
                              height: 0),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 20),
                              Visibility(
                                visible: !bool.parse(controller
                                    .tempNotificationList[index][0]
                                    .toString()),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                      backgroundColor: lemonColor, radius: 4),
                                ),
                              ),
                              Text(
                                controller.tempNotificationList[index][1]
                                    .toString(),
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  controller.tempNotificationList[index][3]
                                      .toString(),
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: deviceWidth - 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                controller.tempNotificationList[index][2]
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Divider(
                              thickness: 0.5,
                              color: lightGreyColor,
                              indent: 25,
                              endIndent: 25,
                              height: 0,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
