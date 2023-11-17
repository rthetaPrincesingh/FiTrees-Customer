import 'package:fitrees_customer/views/authenticationScreen/logInSignUpScreen.dart';
import 'package:fitrees_customer/controllers/screensControllers/onboardingScreenController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onboardingScreen extends StatelessWidget {
  const onboardingScreen({Key? key}) : super(key: key);

  static List imageList = [
    "https://static.toiimg.com/thumb/resizemode-4,width-1200,height-900,msid-77851322/77851322.jpg",
    "https://www.healthdigest.com/img/gallery/this-is-why-your-back-always-hurts-after-doing-squats/intro-1604068187.jpg",
    "https://t4.ftcdn.net/jpg/05/04/57/15/360_F_504571517_2CHgkigD65hvPYtAiP8HJeksGorYc4Ar.jpg"
  ];
  static List onbaordingCaption1 = [
    "MEET YOUR COACH,",
    "CREATE A WORKOUT PLAN",
    "ACTION IS THE",
  ];
  static List onbaordingCaption2 = [
    "START YOUR JOURNEY",
    "TO STAY FIT",
    "KEY TO ALL SUCCESS",
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(onboardingScreenController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: deviceHeight - 200,
                  child: PageView(
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (page) {
                      controller.currentPage.value = page;
                    },
                    children: [
                      onBoardingScreenContent(context, imageList[0], 0),
                      onBoardingScreenContent(context, imageList[1], 1),
                      onBoardingScreenContent(context, imageList[2], 2),
                    ],
                  ),
                ),
                const Spacer(),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          controller.currentPage.value = 0;
                        },
                        child: SizedBox(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 4,
                              width:
                                  controller.currentPage.value == 0 ? 50 : 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.currentPage.value == 0
                                    ? primaryColor
                                    : const Color(0xff3A3A3C),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          controller.currentPage.value = 1;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(
                            height: 40,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 18),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 4,
                                width:
                                    controller.currentPage.value == 1 ? 50 : 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.currentPage.value == 1
                                      ? primaryColor
                                      : const Color(0xff3A3A3C),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          controller.currentPage.value = 2;
                        },
                        child: SizedBox(
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 4,
                              width:
                                  controller.currentPage.value == 2 ? 50 : 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.currentPage.value == 2
                                    ? primaryColor
                                    : const Color(0xff3A3A3C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
            Positioned(
              top: 20,
              right: 30,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap:()=> controller.gotoLogInScreen(),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 0.2
                    ),
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingScreenContent(context, url, index) {
    return Column(
      children: [
        SizedBox(
          height: deviceHeight - 350,
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.black26, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              url,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              onbaordingCaption1[index],
              style: GoogleFonts.dmSans(
                  color: textColor, fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Text(
              onbaordingCaption2[index],
              style: TextStyle(
                  fontFamily: 'integralcf',
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Visibility(
          visible: index == 2,
          child: IntrinsicWidth(
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(48),
              color: primaryColor,
              onPressed: () => Get.find<onboardingScreenController>().gotoLogInScreen(),
              padding: EdgeInsets.zero,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Now  ",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset("assets/icons/right_arrow.svg"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
