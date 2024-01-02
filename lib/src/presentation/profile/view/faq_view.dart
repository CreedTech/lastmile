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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo_single.png',
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('WHAT IS THE LAST-MILE DELIVERY SERVICE, AND HOWDOES ITWORK?',
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
                        "Last-mile delivery is the final stage of the logistics process, where goods are delivered from a distribution center to the end customer's location. Our application connects drivers with nearby deliveries, optimizing routes for efficient and timely drop-offs. ",
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title:
                        Text('HOW CAN I SIGN UP AS A DELIVERY DRIVER FOR THE LAST-MILE SERVICE?',
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
                        'To become a delivery driver, visit our official website or download the mobile app. Look for the "Join Us" or "Become a Driver" section, and follow the prompts to complete the application process Or visit any of our branch offices.',
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                        'WHAT TYPES OF GOODS ARE TYPICALLY DELIVERED THROUGH THE LAST-MILE SERVICE? ',
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
                        "Last-mile delivery can include a variety of goods such as packages, groceries, food, and other items depending on the partnerships and services offered by the logistics company",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('CAN I CHOOSE MY DELIVERY SCHEDULE WITH THE LAST-MILE APPLICATION?',
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
                        "Yes, our application usually allows drivers to set their schedules based on availability. This flexibility enables you to work at times that suit you best. ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('HOW AM I INFORMED ABOUT NEW DELIVERY OPPORTUNITIES?',
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
                        "The application will notify you of available delivery opportunities based on your location and schedule preferences. You'll receive push notifications or alerts within the app.",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('WHAT TOOLS ARE AVAILABLE TO HELP ME NAVIGATE EFFICIENTLY DURING DELIVERIES? ',
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
                        "The last-mile delivery application typically includes GPS navigation features to help you find the fastest and most efficient routes. It may also provide real-time traffic updates. ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('HOW ARE DELIVERY FEES AND EARNINGS CALCULATED?',
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
                        "Earnings are calculated based on factors such as the distance traveled, delivery time, and any bonuses or incentives offered. The application will display a breakdown of your earnings after each completed delivery. ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('IS THERE A RATING SYSTEM FOR DRIVERS AND CUSTOMERS? ',
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
                        "Yes, both drivers and customers usually have the opportunity to provide feedback and ratings. This helps maintain a high standard of service and ensures accountability within the platform.",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('ARE THERE ANY SPECIFIC VEHICLE REQUIREMENTS FOR LAST-MILE DELIVERY DRIVERS? ',
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
                        "Vehicle requirements may vary, but generally, drivers can use cars, bikes, scooters, oreven walk for certain deliveries. The application will specify any vehicle requirements during the onboarding process.",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('HOW IS CUSTOMER SUPPORT HANDLED FOR LAST-MILE DELIVERY DRIVERS? ',
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
                        "Customer support is typically available through the application, offering assistance for any issues or inquiries you may have during deliveries. This can include in-app chat support, a help line, or a support center for more complex matters. ",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.nunito(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: colorsBlack,
                        ),
                      ),
                    ],
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
