import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/data/datasource/auth/controller/auth_controller.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewConsumerState();
}

class _LoginViewConsumerState extends ConsumerState<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool enableSignIn = false;
  bool obscureText = true;
  bool isChecked = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authState = ref.watch(authControllerProvider.notifier);
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
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        'Don\'t have an account? ',style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(register);
                        },
                        child: Text(
                          'Create account',
                          style: TextStyle(
                              color: colorPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: loginFormKey,
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
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                home,
                                (route) => false,
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
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(forgotPass);
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: colorsBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
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
