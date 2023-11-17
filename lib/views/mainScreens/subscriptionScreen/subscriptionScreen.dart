import 'package:fitrees_customer/controllers/screensControllers/subscriptionScreenController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class subscriptionScreen extends StatelessWidget {
  const subscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(subscriptionScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 400,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.black26,
                          Colors.transparent
                        ],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.network(
                      "https://staticg.sportskeeda.com/editor/2022/07/8ba64-16586478826415-1920.jpg?w=840",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BE PREMIUM",
                        style: TextStyle(
                            fontFamily: "integralcf",
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "GET UNLIMITED\nACCESS",
                        style: TextStyle(
                            fontFamily: "integralcf",
                            fontSize: 28,
                            color: textColor,
                            height: 1.2),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "When you subscribe, you’ll get\ninstant unlimited access",
                        style: GoogleFonts.openSans(
                            fontSize: 15,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),

            //Monthly
            Obx(() {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => controller.subscriptionTypeSelected.value = true,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 00, 20, 00),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: controller.subscriptionTypeSelected.value
                          ? redColor.withOpacity(0.1) : greyColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: controller.subscriptionTypeSelected.value
                            ? redColor
                            : greyColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: controller.subscriptionTypeSelected.value
                                ? SvgPicture.asset(
                              "assets/icons/Radio on.svg",
                              height: 20,
                              width: 20,
                              color: redColor.withOpacity(0.7),
                            )
                                : SvgPicture.asset(
                              "assets/icons/Radio off.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 125,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Monthly",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: textColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .end,
                                      children: [
                                        Text(
                                          "₹ ",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: textColor,
                                          ),
                                        ),
                                        Text(
                                          "99.99",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                            color: textColor,
                                          ),
                                        ),
                                        Text(
                                          "  /m",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Pay monthly, cancel any time",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: controller.subscriptionTypeSelected
                                      .value
                                      ? redColor
                                      : textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),

            //Yearly
            Obx(() {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: ()=> controller.subscriptionTypeSelected.value = false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 00),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      color: !controller.subscriptionTypeSelected.value
                          ? redColor.withOpacity(0.1)
                          : greyColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: !controller.subscriptionTypeSelected.value
                            ? redColor
                            : greyColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: !controller.subscriptionTypeSelected.value
                                ? SvgPicture.asset(
                              "assets/icons/Radio on.svg",
                              height: 20,
                              width: 20,
                              color: redColor.withOpacity(0.7),
                            )
                                : SvgPicture.asset(
                              "assets/icons/Radio off.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 125,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Yearly",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: textColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "₹ ",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: textColor,
                                          ),
                                        ),
                                        Text(
                                          "1099.99",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25,
                                            color: textColor,
                                          ),
                                        ),
                                        Text(
                                          "  /y",
                                          style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Pay for a full year",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: !controller.subscriptionTypeSelected
                                      .value
                                      ? redColor
                                      : textColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
              child: IntrinsicWidth(
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(48),
                  color: primaryColor,
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Text(
                        "Subscribe Now",
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
