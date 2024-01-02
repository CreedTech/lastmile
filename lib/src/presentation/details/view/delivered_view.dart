import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class DeliveredView extends StatefulWidget {
  const DeliveredView({super.key});

  @override
  State<DeliveredView> createState() => _DeliveredViewState();
}

class _DeliveredViewState extends State<DeliveredView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_single.png',
                      height: 70.h,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Image.asset(
                      'assets/images/onboardingOne.png',
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'YOUR ORDER HAS BEEN DELIVERED SUCCESSFULLY',
                      textAlign: TextAlign.center,
                    ).boldSized(18.sp).colors(colorsBlack),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Check your message for the details and phone number of our delivery agent',
                      textAlign: TextAlign.center,
                    ).normalSized(14.sp).colors(colorsBlack),
                    SizedBox(
                      height: 50.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 2,
                        alignment: Alignment.center,
                        height: 110.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400.w, 50.h),
                            backgroundColor: colorPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                88,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(ratings);
                          },
                          child: Text(
                            'Give Rating',
                            textAlign: TextAlign.center,
                          ).normalSized(16).colors(colorWhite),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
