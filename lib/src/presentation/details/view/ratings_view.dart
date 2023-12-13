import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../widgets/custom_success_screen.dart';

class RatingsView extends StatefulWidget {
  const RatingsView({super.key});

  @override
  State<RatingsView> createState() => _RatingsViewState();
}

class _RatingsViewState extends State<RatingsView> {
  final TextEditingController _review = TextEditingController();
  double value = 0;

  @override
  void dispose() {
    _review.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 32.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80.sp)),
                    ),
                    child: Image.asset('assets/images/driver.png'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'How was Yinka’s service?',
                    textAlign: TextAlign.center,
                  ).boldSized(18.sp).colors(colorsBlack),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Give ratings according to service',
                    textAlign: TextAlign.center,
                  ).normalSized(14.sp).colors(colorsBlack),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 32.h),
                    child: AnimatedRatingStars(
                      initialRating: 0,
                      onChanged: (rating) {
                        setState(() {
                          rating = rating;
                        });
                      },
                      filledColor: colorPrimary,
                      displayRatingValue: false, // Display the rating value
                      interactiveTooltips:
                          true, // Allow toggling half-star state
                      customFilledIcon: Icons.star_rate_rounded,
                      emptyColor: colorLightGray,
                      customHalfFilledIcon: Icons.star_half_rounded,
                      customEmptyIcon: Icons.star_rate_rounded,
                      starSize: 32.sp,
                      animationDuration: const Duration(milliseconds: 500),
                      animationCurve: Curves.easeInOut,
                    ),
                  ),
                  TextFormField(
                    minLines: 3,
                    keyboardType: TextInputType.multiline,
                    controller: _review,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Leave a Review...',
                    ),
                    // labelText: 'Email Address',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 56.h),
                      child: Text(
                        'Get Help?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: colorPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomSuccessScreen(
                                  title: 'Thank You',
                                  info:
                                      'Your feedback will be used to improve our service',
                                  route: home,
                                  buttonTitle: 'Done',
                                ),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                        ).normalSized(16).colors(colorWhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
