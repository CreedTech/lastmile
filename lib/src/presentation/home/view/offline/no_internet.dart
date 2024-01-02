import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/core.dart';

class No_internetScreen extends StatefulWidget {
  final VoidCallback onTap;

  const No_internetScreen({super.key, required this.onTap});

  @override
  State<No_internetScreen> createState() => _No_internetScreenState();
}

class _No_internetScreenState extends State<No_internetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 230.h, horizontal: 25.h),
              child: Column(
                children: [
                  Column(
                    children: [
                      // Image.asset(
                      //   logotryagain,
                      //   height:110.h,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFBCFCF),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.h),
                          child: Icon(
                            Iconsax.emoji_sad5,
                            size: 55.sp,
                            color: colorPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        'No Internet Connection',
                        style: GoogleFonts.nunito(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Internet connection required, please connect to the the internet and try again. Thank you!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontSize: 17.sp,
                          color: Color(0xFFB5B5B5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 50.h,
                   width: MediaQuery.sizeOf(context).width * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                  ),
                  child: Text(
                    'Try Again',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ),
              //             GestureDetector(
              //   onTap: widget.onTap,
              //   child: ClipPath(
              //     clipper: CustomClip(),
              //     child: Container(
              //       height: 70.h,
              //       width: MediaQuery.sizeOf(context).width * 0.8,
              //       color: buttonColor,
              //       alignment: Alignment.center,
              //       child: Text(
              //         buttonText,
              //         style: GoogleFonts.nunito(
              //           color: buttonTextColor,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 21.sp,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
