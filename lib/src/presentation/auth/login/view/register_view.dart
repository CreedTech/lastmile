import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/otp_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  // bool enableSignIn = false;
  bool obscureText = true;
  // bool isChecked = false;
  // GlobalKey<FormState> _formKey = GlobalKey();

  // FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Image.asset(
            'assets/images/logo.png',
            height: 72.h,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              // bottom: 0.h,
              child: Center(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // spacing: 8.0,
                    // runSpacing: 8.0,
                    children: [
                      Text(
                        'By continuing, you accept our ',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Terms & Conditions ',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text('and ',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Privacy Policy ',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: colorsBlack,
                          ),
                          // labelText: 'Email Address',
                          hintText: '',
                          controller: _emailController,
                          legend: 'Email',
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
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: colorsBlack,
                          ),
                          legend: 'Password',
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
                          padding: EdgeInsets.only(top: 105.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpView(
                                    email: 'example@example.com',
                                  ),
                                ),
                              );
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
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(88.sp)),
                              ),
                              child: Text(
                                'Sign Up',
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
    );
  }
}
