import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import 'delivery_success_view.dart';

class ConnectingDispatchView extends StatefulWidget {
  const ConnectingDispatchView({super.key});

  @override
  State<ConnectingDispatchView> createState() => _ConnectingDispatchViewState();
}

class _ConnectingDispatchViewState extends State<ConnectingDispatchView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool showConnectingText = true;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          // Check if more than 5 seconds have passed, then hide the connecting text
          // print(controller.value);
          if (controller.value >= 0.9) {
            showConnectingText = false;
          }
        });
      });
    controller.repeat(reverse: false);

    // Call _navigateToNextScreen after a random number of seconds
    _scheduleNavigation();

    super.initState();
  }

  void _scheduleNavigation() {
    // Generate a random number of seconds between 5 and 15
    final random = Random();
    final randomSeconds = random.nextInt(11) + 5;

    // Schedule the navigation after the random number of seconds
    Future.delayed(
        Duration(seconds: randomSeconds), () => _navigateToNextScreen());
  }

  void _navigateToNextScreen() {
    // Replace 'YourNextScreen()' with the widget or screen you want to navigate to
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeliverySuccessView()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //  void _navigateToNextScreen() {
  //   // Replace 'YourNextScreen()' with the widget or screen you want to navigate to
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => YourNextScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/map_bg.png'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset(
                'assets/images/points.png',
                width: 250.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 100.h,
              ),
              child: Center(
                child: Container(
                  width: 350.w,
                  // height: 370.h,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.sp),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h,
                      horizontal: 16.w,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Connecting to dispatch',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 24.sp, bottom: 30.sp),
                              child: Text(
                                  'Dispatch will be on their way as soon as they confirm order',
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                  )),
                            ),
                            LinearProgressIndicator(
                              value: controller.value,
                              semanticsLabel: 'Linear progress indicator',
                              backgroundColor: Color(0xffF6CFCF),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 30.sp,
                              ),
                              child: showConnectingText
                                  ? Text(
                                      'Please wait while we connect you to a rider',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: colorGray,
                                      ),
                                    )
                                  : Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 48.w,
                                            height: 48.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(80.sp)),
                                            ),
                                            child: Image.asset(
                                                'assets/images/driver.png'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.h),
                                            child: Text(
                                              'Yinka Williams',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.sp,
                                                // color: colorGray,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '15 Minutes Away',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                              color: colorGray,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ],
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
}
