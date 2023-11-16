import 'package:fitrees_customer/controllers/workoutCatergoriesScreenController.dart';
import 'package:fitrees_customer/modules/upgradeToPremiumPopup.dart';
import 'package:fitrees_customer/modules/proUserPopup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class workoutCatergoriesScreen extends StatelessWidget {
  const workoutCatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(workoutCatergoriesScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: deviceHeight - 50,
            width: deviceWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("Workout Categories", style: GoogleFonts.openSans(color: textColor, fontWeight: FontWeight.w600, fontSize: 23),),
                ),
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
                const SizedBox(height:20),
                Expanded(
                  child: SizedBox(
                    width: deviceWidth - 40,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 6,
                      itemBuilder: (context, index) =>
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: ()=> index < 2 ? proUserPopup(context) : upgradeToPremiumPopup(context),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                        "Wake Up Call",
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
                                            color: index < 2 ? primaryColor : redColor,
                                          ),
                                          Text(
                                            "  0$index Workouts for Beginner",
                                            style: GoogleFonts.openSans(
                                              fontSize: 16,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Spacer(),
                                          Visibility(
                                            visible: index > 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: redColor,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(2,1,2,1),
                                                child: Text(" PRO ",
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 12,
                                                        color: textColor,
                                                        fontWeight: FontWeight.w700)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
      ),
    );
  }
}
