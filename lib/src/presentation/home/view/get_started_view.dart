import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
          child: Stack(
            children: [
              Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 70.h,
                    ),
                    Image.asset(
                      'assets/images/onboardingOne.png',
                      height: 170.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colorGray,
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        // boxShadow: Box
                      ),
                      width: 56.w,
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      children: [
                        Text('Welcome').mediumSized(25.sp).colors(colorsBlack),
                        Text('Continue with one of the following options')
                            .normalSized(16.sp)
                            .colors(textGray),
                        SizedBox(
                          height: 48.h,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400.w, 50.h),
                            backgroundColor: colorPrimary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  88), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(login);
                          },
                          child: const Text(
                            'Sign in',
                            textAlign: TextAlign.center,
                          ).normalSized(16).colors(colorWhite),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400.w, 50.h),
                            backgroundColor: colorsBlack,
                            side: const BorderSide(color: colorsBlack),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  88), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(register);
                          },
                          child: const Text(
                            'Create An Account',
                            textAlign: TextAlign.center,
                          ).normalSized(16.sp).colors(colorWhite),
                        ),
                      ],
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
