import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';

class CustomSuccessScreen extends StatelessWidget {
  const CustomSuccessScreen(
      {super.key,
      required this.info,
      required this.route,
      required this.title,
      required this.buttonTitle});
  final String title;
  final String info;
  final String route;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo_single.png',
                      height: 70.h,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Image.asset(
                      'assets/icons/success.png',
                      height: 300.h,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ).boldSized(31.sp).colors(colorsBlack),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      info,
                      textAlign: TextAlign.center,
                    ).normalSized(14.sp).colors(colorsBlack),
                    SizedBox(
                      height: 50.h,
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
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                route, (route) => false);
                          },
                          child: Text(
                            buttonTitle,
                            textAlign: TextAlign.center,
                          ).normalSized(16).colors(colorWhite),
                        ),
                      ),
                    )
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
