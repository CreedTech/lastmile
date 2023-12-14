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
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100.h,
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
                'At TAA Logistics, we believe that everyone should have access to fast, reliable, and affordable package delivery.',
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: colorGray,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Image.asset(
                  'assets/images/about_us.png',
                  // height: 80.h,
                ),
              ),
              Text(
                "We understand that your packages are important to you, so we've taken the time to develop a system that is both secure and efficient. Our couriers are all background-checked and insured, and we use the latest tracking technology to ensure that your package is always in good hands.",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: colorGray,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "We also offer a variety of delivery options to meet your needs, whether you need your package delivered same-day, overnight, or at a specific time. And because we're committed to providing our customers with the best possible experience, we offer competitive rates and a money-back satisfaction guarantee.",
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: colorGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
