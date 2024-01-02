import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        title: Text(
          'About Us',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_single.png',
                  height: 200.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 29.h),
                  child: Text(
                    'About Us',
                    style: GoogleFonts.nunito(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'TAA Connect Logistics is a technology and innovative logistics company. We are dedicated to providing seamless, efficient and secured services using the platform. TAA Connect Logistics envisions a future where logistics is not just a service but a dynamic, and collaborative ecosystem. ',
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: colorGray,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16.h),
                //   child: Image.asset(
                //     'assets/images/about_us.png',
                //     // height: 80.h,
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Our Goal',
                  style: GoogleFonts.nunito(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: colorsBlack,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    "Our goal is to fulfill all logistics and delivery services of individuals, corporate entities, E-commerce, and business owners in Nigeria and beyond. ",
                    style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: colorGray,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Our Mission',
                  style: GoogleFonts.nunito(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: colorsBlack,
                  ),
                ),
                Text(
                  "Our mission is to improve on the existing system by leveraging on cutting-edge technology, skilled and trained riders to ensure that customers package is delivered safely, securely and timely. ",
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: colorGray,
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
