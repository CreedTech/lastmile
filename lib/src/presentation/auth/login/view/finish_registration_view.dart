import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/widgets/custom_success_screen.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';

class FinishRegistrationView extends StatefulWidget {
  const FinishRegistrationView({super.key, required this.phone_number});
  final String phone_number;

  @override
  State<FinishRegistrationView> createState() => _FinishRegistrationViewState();
}

class _FinishRegistrationViewState extends State<FinishRegistrationView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  final registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Finish Registration',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150.h,
                    ),
                    Form(
                      key: registerFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'First Name',
                            controller: _firstNameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input a valid name';
                              }
                              if (value.length < 2) {
                                return 'Min. 2 characters';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            hintText: 'Last Name',
                            controller: _lastNameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Input a valid name';
                              }
                              if (value.length < 2) {
                                return 'Min. 2 characters';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
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
                          // SizedBox(height: 10.h),
                          CustomTextField(
                            hintText: 'Password',
                            // labelText: 'Password',
                            controller: _passwordController,
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 25.h),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'By selecting Agree & Continue, I agree with',
                                    style: GoogleFonts.nunito(
                                      color: colorsBlack,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' Terms & Conditions, Payment Terms of Service & Privacy Policy',
                                    style: GoogleFonts.nunito(
                                        color: colorPrimary,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomSuccessScreen(
                                        title: 'Welcome',
                                        info:
                                            'More than just a simple package delivery application now has more benefits',
                                        route: login,
                                      ),
                                    ),
                                    (route) => false);
                                // if (loginFormKey.currentState!.validate()) {
                                //   authState.signIn(
                                //       context,
                                //       _emailController.text.trim(),
                                //       _passwordController.text.trim());
                                // }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(33, 35, 39, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Text(
                                  'Agree & Continue',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.white),
                                ),
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
