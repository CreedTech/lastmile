import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/presentation/auth/login/view/reset_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/core.dart';
import '../../../../data/datasource/auth/controller/auth_controller.dart';

class ForgotPasswordOtpVerification extends ConsumerStatefulWidget {
  const ForgotPasswordOtpVerification({super.key, required this.email});
  final String email;

  @override
  ConsumerState<ForgotPasswordOtpVerification> createState() =>
      _ForgotPasswordOtpVerificationConsumerState();
}

class _ForgotPasswordOtpVerificationConsumerState
    extends ConsumerState<ForgotPasswordOtpVerification> {
  int _minutes = 3; // Initialize minutes to 3
  int _seconds = 0; // Initialize seconds to 0
  Timer? _timer;
  String currentText = "";
  bool isClicked = false;

  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> otprestpwdFormKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    super.initState();
    startCountDown();
    errorController = StreamController<ErrorAnimationType>();
  }

  void startCountDown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_minutes == 0 && _seconds == 0) {
        _timer?.cancel();
      } else if (_seconds == 0) {
        setState(() {
          _minutes--;
          _seconds = 59;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void resetCountdown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    setState(() {
      _minutes = 3;
      _seconds = 0;
    });
    startCountDown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.read(authControllerProvider.notifier);
    String formattedTime = '$_minutes:${_seconds.toString().padLeft(2, '0')}';
    return Scaffold(
      backgroundColor: colorWhite,
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
          'OTP',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Wrap(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // spacing: 8.0,
                          // runSpacing: 8.0,
                          children: [
                            Text(
                              'We sent a code to your email ',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                widget.email,
                                style: TextStyle(
                                  color: colorPrimary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: otprestpwdFormKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 14,
                          ),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: colorPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,

                            validator: (v) {
                              if (v!.length < 3) {
                                return "Fill all Inputs";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 56,
                                fieldWidth: 80,
                                activeFillColor: colorsBlack,
                                activeColor: colorsBlack,
                                inactiveColor: colorGray,
                                selectedFillColor: colorGray,
                                selectedColor: colorGray,
                                disabledColor: colorGray,
                                selectedBorderWidth: 1,
                                borderWidth: 2,
                                inactiveBorderWidth: 2,
                                activeBorderWidth: 2,
                                inactiveFillColor: colorGray),
                            cursorColor: Colors.black,
                            // animationDuration:
                            //     const Duration(milliseconds: 300),
                            enableActiveFill: false,
                            errorAnimationController: errorController,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              debugPrint(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 0.w),
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
                              // if (otprestpwdFormKey.currentState!.validate()) {
                              //   authState.verifyForgotPasswordOtp(
                              //     context,
                              //     widget.email,
                              //     otpController.text.trim(),
                              //   );
                              //   otpController.clear();
                              // }
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordView(
                                                email: 'widget.email'),
                                      ),
                                    );
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => CustomSuccessScreen(
                              //         title: 'Successful',
                              //         info:
                              //             'Password has been changed successfully',
                              //         route: login,
                              //         buttonTitle: 'Sign In',
                              //       ),
                              //     ),
                              //     (route) => false);
                            },
                            child: const Text(
                              'Reset Password',
                              textAlign: TextAlign.center,
                            ).normalSized(16).colors(colorWhite),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Didn\'t receive the mail?',
                              ).mediumSized(16.sp).colors(colorsBlack),
                              // const SizedBox(
                              //   width: 10,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isClicked = true;
                                  });
                                  resetCountdown();
                                  authState.resendPasswordOtp(
                                      context, widget.email);
                                },
                                child: Text(
                                  ' Click here',
                                  style: GoogleFonts.nunito(letterSpacing: 0),
                                ).normalSized(16.sp).colors(colorPrimary),
                              ),
                            ],
                          ),
                          if (isClicked == true)
                            Text(
                              formattedTime,
                              style: GoogleFonts.nunito(letterSpacing: 0),
                            ).semiBoldSized(16.sp).colors(colorPrimary),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
