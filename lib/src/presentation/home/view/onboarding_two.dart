import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class OnboardingViewTwo extends StatefulWidget {
  const OnboardingViewTwo({super.key});

  @override
  State<OnboardingViewTwo> createState() => _OnboardingViewTwoState();
}

class _OnboardingViewTwoState extends State<OnboardingViewTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Stack(
            children: [
              Positioned(
                  top: 20.h,
                  right: 10.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(onboardingThree);
                    },
                    child: const Text(
                      'Next',
                      textAlign: TextAlign.center,
                    ).normalSized(16).colors(colorsBlack),
                  )),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_single.png',
                      height: 70.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      'assets/images/onboardingTwo.png',
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const Text(
                      '24 hours delivery',
                      textAlign: TextAlign.center,
                    ).semiBoldSized(20).colors(colorsBlack),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      'We delivery your parcels to every corner, no location is beyond oyr reach',
                      textAlign: TextAlign.center,
                    ).normalSized(16).colors(colorsBlack),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 5.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 30.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 5.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
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
                            backgroundColor: colorsBlack,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(onboardingThree);
                          },
                          child: const Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                          ).normalSized(16).colors(colorWhite),
                        ),
                      ),
                    ),
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
