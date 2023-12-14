import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/profile/view/help_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Padding(
        padding: EdgeInsets.symmetric(
            // horizontal: 16.w,
            // vertical: 32.h,
            ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                  vertical: 32.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.close,
                          size: 24.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelpView(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(112.0), // Border radius
                              color: colorsBlack,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 29.w, vertical: 10.h),
                              child: Text(
                                'Help',
                                style: GoogleFonts.nunito(
                                  color: colorWhite,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Hello, Solomon!',
                      style: GoogleFonts.nunito(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          color: colorWhite),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child:
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.close,
            //           size: 24.sp,
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //             borderRadius:
            //                 BorderRadius.circular(112.0), // Border radius
            //             color: colorsBlack,
            //           ),
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: 29.w, vertical: 10.h),
            //             child: Text(
            //               'Help',
            //               style: GoogleFonts.nunito(
            //                 color: colorWhite,
            //                 fontSize: 16.sp,
            //                 fontWeight: FontWeight.w400,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),

            // ),

            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 39.h, left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 32.h),
                        child: Text(
                          'Account',
                          style: GoogleFonts.nunito(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: colorsBlack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.person_outline,
                            color: colorsBlack,
                          ),
                          title: Text(
                            'My Information',
                            style: GoogleFonts.nunito(
                              color: colorsBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, my_information);
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorGray,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.lightbulb_outline,
                            color: colorsBlack,
                          ),
                          title: Text(
                            'About Us',
                            style: GoogleFonts.nunito(
                              color: colorsBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, about_us);
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorGray,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.shield_outlined,
                            color: colorsBlack,
                          ),
                          title: Text(
                            'Terms & Conditions',
                            style: GoogleFonts.nunito(
                              color: colorsBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, terms_conditions);
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorGray,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            Icons.help_outline,
                            color: colorsBlack,
                          ),
                          title: Text(
                            'FAQ',
                            style: GoogleFonts.nunito(
                              color: colorsBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, faqs);
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorGray,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: ListTile(
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset(
                            'assets/icons/logout.png',
                            width: 20.w,
                          ),
                          //  const Icon(
                          //   Icons.logout_rounded,
                          //   color: colorsBlack,
                          // ),
                          title: Text(
                            'Log out',
                            style: GoogleFonts.nunito(
                              color: colorsBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            SystemNavigator.pop();
                            // Navigator.pushNamed(context, RouteList.profile);
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: colorGray,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(),
          ],
        ),
      ),
    );
  }
}
