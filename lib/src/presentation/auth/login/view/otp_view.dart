import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/data/datasource/auth/controller/auth_controller.dart';
import 'package:lastmile/src/presentation/auth/login/view/reset_password_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/core.dart';

class OtpView extends ConsumerStatefulWidget {
  const OtpView({super.key, required this.email});
  final String email;

  @override
  ConsumerState<OtpView> createState() => _OtpViewConsumerState();
}

class _OtpViewConsumerState extends ConsumerState<OtpView> {
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
        leading: Icon(
          Icons.close,
          color: colorsBlack,
        ),
        title: Text(
          'OTP',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Enter verification code')
                              .boldSized(20.sp)
                              .colors(colorsBlack),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('We have sent a reset code to your email')
                              .normalSized(14.sp)
                              .colors(colorsBlack),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('example@gmail.com')
                              .normalSized(16.sp)
                              .colors(colorsBlack),
                        ),
                      ],
                    ),
                    //  RichText(
                    //   textAlign: TextAlign.left,
                    //   text: TextSpan(
                    //       style: GoogleFonts.nunito(
                    //         fontWeight: FontWeight.w700,
                    //         fontSize: 18,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: "We've sent a verification code to ",
                    //           style: GoogleFonts.nunito(color: colorsBlack),
                    //         ),
                    //         TextSpan(
                    //           text: widget.email,
                    //           style: GoogleFonts.nunito(
                    //             color: colorsBlack,
                    //             fontWeight: FontWeight.w800,
                    //           ),
                    //         ),
                    //       ],
                    //       ),
                    // ),
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
                            horizontal: 30,
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
                                fieldHeight: 50,
                                fieldWidth: 50,
                                activeFillColor: colorGray,
                                activeColor: colorGray,
                                inactiveColor: colorGray,
                                selectedFillColor: colorGray,
                                selectedColor: colorGray,
                                disabledColor: colorGray,
                                inactiveFillColor: colorGray),
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
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
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Didn\'t receive any code?',
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
                                    ' Resend Code',
                                    style: GoogleFonts.nunito(letterSpacing: 0),
                                  ).semiBoldSized(16.sp).colors(colorPrimary),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400.w, 50.h),
                    backgroundColor: colorsBlack,
                    elevation: 0,
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
                                ResetPasswordView(email: 'widget.email')));
                  },
                  child: const Text(
                    'Continue',
                    textAlign: TextAlign.center,
                  ).normalSized(16).colors(colorWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
