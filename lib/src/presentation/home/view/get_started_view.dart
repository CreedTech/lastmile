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
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 500.h,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 2,
                            alignment: Alignment.center,
                            // height: 110.h,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(400.w, 50.h),
                                    backgroundColor: colorsBlack,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(login);
                                  },
                                  child: const Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                  ).normalSized(16).colors(colorWhite),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(400.w, 50.h),
                                    backgroundColor: colorWhite,
                                    side: const BorderSide(color: colorsBlack),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    // Guide.toReplacment(name: getStarted);
                                  },
                                  child: const Text(
                                    'Create Account',
                                    textAlign: TextAlign.center,
                                  ).normalSized(16.sp).colors(colorsBlack),
                                ),
                              ],
                            ),
                          ),
                        )
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
