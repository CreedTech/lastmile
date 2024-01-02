import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/forgot_password_otp_verify_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';

import '../../../../data/datasource/auth/controller/auth_controller.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() =>
      _ForgotPasswordViewConsumerState();
}

class _ForgotPasswordViewConsumerState
    extends ConsumerState<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final psswdformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider.notifier);
    return Scaffold(
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
          'Forget Password',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_single.png',
                    // height: 300.h,
                  ),
                  Form(
                    key: psswdformKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Enter your email address to reset password'),
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: colorsBlack,
                          ),
                          // labelText: 'Email Address',
                          legend: 'Email address',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Input a valid email address';
                            }
                            if (!value.contains('@')) {
                              return 'Include @ symbol in your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 120.h),
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
                                    if (psswdformKey.currentState!.validate()) {
                                      authState.forgotPassword(
                                        context,
                                        _emailController.text.trim(),
                                      );
                                      // _emailController.clear();
                                    }
                                    // Navigator.of(context).pushNamed(otp_verify);
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
    );
  }
}
