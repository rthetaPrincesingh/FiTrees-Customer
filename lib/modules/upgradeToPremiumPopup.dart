import 'package:fitrees_customer/views/mainScreens/subscriptionScreen/subscriptionScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void upgradeToPremiumPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          GestureDetector(
            onTap:()=> Get.back(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),

          Center(
            child: Dialog(
              elevation: 10.0,
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: greyColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: deviceWidth - 50,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          stops: [0.25, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            image: NetworkImage(
                              "https://media.istockphoto.com/id/1001575694/photo/young-man-fitness-workout-push-ups-or-plank.jpg?s=612x612&w=0&k=20&c=SH7ndWstH0a2X17qGa_YUVW6ZWLTpqHyXtyGtOVYu1Q=",
                            ),
                            opacity: 0.6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Upgrade to Premium",
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Subscribe to take an appointment",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                      child: SizedBox(
                        width: deviceWidth,
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(48),
                          color: primaryColor,
                          onPressed: () => Get.to(subscriptionScreen()),
                          padding: EdgeInsets.zero,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                            child: Text(
                              "Be Premium",
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
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: ()=> Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.openSans(
                            color: textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
