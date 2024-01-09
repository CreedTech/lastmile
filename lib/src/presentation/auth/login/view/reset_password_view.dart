import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../../data/datasource/auth/controller/auth_controller.dart';
import '../../../widgets/custom_text_field.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView(
      {super.key, required this.email, required this.token});
  final String email;
  final String token;

  @override
  ConsumerState<ResetPasswordView> createState() =>
      _ResetPasswordViewConsumerState();
}

class _ResetPasswordViewConsumerState extends ConsumerState<ResetPasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final resetpsswdformKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.read(authControllerProvider.notifier);
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
            Icons.close,
            color: colorsBlack,
          ),
        ),
        title: Text(
          'Reset Password',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      // height: 300.h,
                    ),
                    Form(
                      key: resetpsswdformKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: colorsBlack,
                            ),
                            legend: 'Password',
                            // labelText: 'Password',
                            controller: newPasswordController,
                            obscureText: obscureText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input a valid password';
                              }
                              if (value.length < 8) {
                                return "Min. 8 characters";
                              }

                              return null;
                            },
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: textGray,
                                size: 18.sp,
                              ),
                            ),
                          ),
                          CustomTextField(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: colorsBlack,
                            ),
                            legend: 'Confirm Password',
                            controller: confirmPasswordController,
                            obscureText: obscureText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != newPasswordController.text) {
                                return 'Passwords do not match';
                              }

                              return null;
                            },
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: textGray,
                                size: 18.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 70.h),
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
                                      backgroundColor: colorPrimary,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          88,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      print(widget.token);
                                      if (resetpsswdformKey.currentState!
                                          .validate()) {
                                        // Resend Email Verification Code
                                        authState.resetPassword(
                                          context,
                                          widget.email,
                                          widget.token,
                                          newPasswordController.text.trim(),
                                        );
                                        // resetPasswordDialog(context);
                                      }
                                    },
                                    child: const Text(
                                      'Continue',
                                      textAlign: TextAlign.center,
                                    ).normalSized(16).colors(colorWhite),
                                  ),
                                ],
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
    );
  }
}
