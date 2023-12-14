import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';

class FAQView extends StatefulWidget {
  const FAQView({super.key});

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
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
          'FAQ',
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
                  'Find the most asked questions and their answers right here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text('How can I track my shipment?',
                    style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    )),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                tilePadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  Text(
                    "You can track your shipment by using the unique tracking number provided to you. Simply enter the tracking number on our website or app, and you'll get real-time updates on your package's location and status.",
                    style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title:
                    Text('What is the estimated delivery time for my shipment?',
                        style: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                tilePadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  Text(
                    "The estimated delivery time depends on the shipping method you've chosen and the destination. We provide delivery time estimates during the checkout process. Keep in mind that these are approximate delivery times and subject to change due to unforeseen circumstances.",
                    style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                    'Can I change the delivery address or schedule for my package?',
                    style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    )),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                tilePadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: colorPrimary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text('What are your delivery rates and fees?',
                    style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    )),
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                tilePadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: colorPrimary,
                      decoration: TextDecoration.underline,
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
