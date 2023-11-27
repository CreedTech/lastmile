import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/otp_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final psswdformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    'assets/images/logo.png',
                    // height: 300.h,
                  ),
                  Form(
                    key: psswdformKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Enter your email address to reset password'),
                        CustomTextField(
                          // labelText: 'Email Address',
                          hintText: 'Email address',
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
                                    backgroundColor: colorsBlack,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OtpView(
                                                email: 'widget.email')));
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
