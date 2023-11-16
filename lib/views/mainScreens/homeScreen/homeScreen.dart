import 'package:fitrees_customer/views/mainScreens/homeScreen/attendenceScreen/attendenceScreen.dart';
import 'package:fitrees_customer/views/mainScreens/homeScreen/videoPlayerScreen/videoPlayerScreen.dart';
import 'package:fitrees_customer/views/mainScreens/homeScreen/workoutCatergoriesScreen/workoutCatergoriesScreen.dart';
import 'package:fitrees_customer/controllers/authentication/userAuthentication.dart';
import 'package:fitrees_customer/controllers/homeScreenController.dart';
import 'package:fitrees_customer/modules/DateTimeConvert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(homeScreenController());
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "HELLO ",
                              style: TextStyle(
                                fontFamily: 'integralcf',
                                color: textColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Tooltip(
                              message: "${userData.firstName}",
                              child: Text(
                                "${userData.firstName},",
                                style: TextStyle(
                                  fontFamily: 'integralcf',
                                  color: textColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Good morning.",
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.to(()=> const attendenceScreen()),
                      child: Container(
                        width: 50,
                        height: 80,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weekDayToWeekname(DateTime
                                  .now()
                                  .weekday).substring(0, 3),
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              DateTime
                                  .now()
                                  .day
                                  .toString(),
                              style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,20),
                child: Row(
                  children: [
                    Text(
                      "Today Workout Plan",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "${weekDayToWeekname(DateTime
                          .now()
                          .weekday).substring(0, 3)}, ${DateTime
                              .now()
                              .day} ${monthToMonthname(DateTime
                              .now()
                              .month)}",
                      style: GoogleFonts.openSans(
                          fontSize: 17,
                          color: primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: ()=> Get.to(()=> youtubeVideoScreen()),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: [0.25, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          image: NetworkImage(
                            "https://api.universalstudentliving.com/wp-content/uploads/2022/10/shutterstock_721502437-768x513.jpg",
                          ),
                          opacity: 0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Day 01 - Warm Up",
                            style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 15,
                                width: 2,
                                color: primaryColor,
                              ),
                              Text(
                                " 07:00 - 08:00 AM",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: ()=> Get.to(workoutCatergoriesScreen()),
                      child: Row(
                        children: [
                          Text(
                            "Workout Categories",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "See All",
                            style: GoogleFonts.openSans(
                                fontSize: 17,
                                color: primaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(() {
                      return Container(
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 40,
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                              controller.selectedExperienceLevel.value = 0,
                              child: Container(
                                height: 40,
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width - 40) / 3,
                                decoration: BoxDecoration(
                                  color: controller.selectedExperienceLevel
                                      .value == 0
                                      ? primaryColor
                                      : lightGreyColor,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Text(
                                    "Beginner",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      controller.selectedExperienceLevel.value ==
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
                              controller.selectedExperienceLevel.value = 1,
                              child: Container(
                                height: 40,
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width - 40) / 3,
                                decoration: BoxDecoration(
                                  color: controller.selectedExperienceLevel
                                      .value == 1
                                      ? primaryColor
                                      : lightGreyColor,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Text(
                                    "Intermediate",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      controller.selectedExperienceLevel.value ==
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
                              controller.selectedExperienceLevel.value = 2,
                              child: Container(
                                height: 40,
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width - 40) / 3,
                                decoration: BoxDecoration(
                                  color: controller.selectedExperienceLevel
                                      .value == 2
                                      ? primaryColor
                                      : lightGreyColor,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Center(
                                  child: Text(
                                    "Advance",
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      controller.selectedExperienceLevel.value ==
                                          2
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 50,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.25, 1],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                image: NetworkImage(
                                  "https://media.istockphoto.com/id/1001575694/photo/young-man-fitness-workout-push-ups-or-plank.jpg?s=612x612&w=0&k=20&c=SH7ndWstH0a2X17qGa_YUVW6ZWLTpqHyXtyGtOVYu1Q=",
                                ),
                                opacity: 0.6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Learn the Basic of Training",
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 2,
                                      color: lemonColor,
                                    ),
                                    Text(
                                      " 06 Workouts  for Beginner",
                                      style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Workouts",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Container(
                          width: 180,
                          height: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.25, 1],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                image: NetworkImage(
                                  "https://e1.pxfuel.com/desktop-wallpaper/240/888/desktop-wallpaper-fitness-man-women-muscles.jpg",
                                ),
                                opacity: 0.6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Learn",
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 2,
                                      color: lemonColor,
                                    ),
                                    Text(
                                      " 06 Workouts",
                                      style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
