import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class OnboardingViewThree extends StatefulWidget {
  const OnboardingViewThree({super.key});

  @override
  State<OnboardingViewThree> createState() => _OnboardingViewThreeState();
}

class _OnboardingViewThreeState extends State<OnboardingViewThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Prev',
                        textAlign: TextAlign.center,
                      ).normalSized(16).colors(colorsBlack),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(getStarted);
                      },
                      child: const Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                      ).normalSized(16).colors(colorsBlack),
                    ),
                  ],
                ),
              ),
              // Positioned(
              //     top: 20.h,
              //     right: 10.w,
              //     child: GestureDetector(
              //       onTap: () {
              //         Guide.toReplacment(name: getStarted);
              //       },
              //       child: const Text(
              //         'Get Started',
              //         textAlign: TextAlign.center,
              //       ).normalSized(16).colors(colorsBlack),
              //     )),
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
                      'assets/images/onboardingThree.png',
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const Text(
                      'On demand and runtime location',
                      textAlign: TextAlign.center,
                    ).semiBoldSized(20).colors(colorsBlack),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      'We pick up from your desired location at your preferred date and time',
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
                            width: 5.w,
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
                            width: 30.w,
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
                      height: 120.h,
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
