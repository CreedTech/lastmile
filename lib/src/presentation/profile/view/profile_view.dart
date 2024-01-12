import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/profile/view/help_view.dart';

import '../../../data/api/global_services.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String first_name = '';
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    String firstNameValue =
        await GlobalService.sharedPreferencesManager.getFirstName();
    setState(() {
      first_name = firstNameValue;
      print('first_name');
      print(first_name);
    });
  }

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
                      'Hello, $first_name!',
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
                          onTap: () async {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AlertDialog.adaptive(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                30, 10, 30, 20),
                                        elevation: 0,
                                        alignment: Alignment.bottomCenter,
                                        insetPadding: const EdgeInsets.all(0),
                                        scrollable: true,
                                        title: null,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                        ),
                                        content: SizedBox(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.h),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 15.h),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            'Confirm Log Out',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .nunito(
                                                              color:
                                                                  colorsBlack,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.h),
                                                        child: Column(
                                                          children: [
                                                            ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    Size(400.w,
                                                                        50.h),
                                                                backgroundColor:
                                                                    colorPrimary,
                                                                elevation: 0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    88,
                                                                  ),
                                                                ),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await GlobalService
                                                                    .sharedPreferencesManager
                                                                    .logOut(
                                                                        context);
                                                              },
                                                              child: const Text(
                                                                'Confirm',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              )
                                                                  .normalSized(
                                                                      16)
                                                                  .colors(
                                                                      colorWhite),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          30.w),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                  'Cancel',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunito(
                                                                    color:
                                                                        colorPrimary,
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                            // SystemNavigator.pop();
                            // await GlobalService.sharedPreferencesManager
                            //     .logOut(context);
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
