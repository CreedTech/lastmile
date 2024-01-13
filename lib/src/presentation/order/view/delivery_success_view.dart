import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

class DeliverySuccessView extends StatefulWidget {
  const DeliverySuccessView({super.key, required this.title});
  final String title;

  @override
  State<DeliverySuccessView> createState() => _DeliverySuccessViewState();
}

class _DeliverySuccessViewState extends State<DeliverySuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 52.h,
            horizontal: 16.w,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/success.png',
                    width: 70.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Your delivery order has been placed successfully.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            'Dispatch is currently en route to pickup your order.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                    child: Text(
                      'Macbook Pro 2022',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0.h, bottom: 32.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tracking ID: BLQ65807654',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: colorGray,
                          ),
                        ),
                        Center(
                          child: Icon(
                            Icons.copy,
                            color: colorPrimary,
                            size: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 65.w,
                          height: 65.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.sp)),
                          ),
                          child: Image.asset('assets/images/driver.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 17.h, bottom: 8.h),
                          child: Text(
                            'Yinka Williams',
                            // textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              fontSize: 22.sp,
                              // color: colorGray,
                            ),
                          ),
                        ),
                        Text(
                          '48 Deliveries',
                          // textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: colorGray,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'License plate number',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: colorGray,
                                    ),
                                  ),
                                  Text(
                                    'TKE306IJ',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: colorsBlack,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vehicle',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: colorGray,
                                    ),
                                  ),
                                  Text(
                                    'Suzuki Motorcycle',
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: colorsBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.h, bottom: 35.h),
                          child: Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.sp)),
                              color: Color(0xff3BB54A),
                            ),
                            child: Image.asset(
                              'assets/icons/phone.png',
                              color: colorWhite,
                              scale: 3,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  home,
                                );
                              },
                              child: Container(
                                // width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(88.sp)),
                                ),
                                child: Text(
                                  'Live Track',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              home,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 29.h),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
