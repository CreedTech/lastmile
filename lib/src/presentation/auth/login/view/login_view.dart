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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            // alignment: ,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 300.h,
                    ),
                    Form(
                      key: loginFormKey,
                      child: Column(
                        children: [
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Checkbox(
                                        visualDensity: VisualDensity
                                            .adaptivePlatformDensity,
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('Remember me')
                                          .normalSized(12.sp),
                                    ),
                                  ],
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
                                          color: colorPrimary,
                                          fontSize: 12.sp,
                                          leadingDistribution:
                                              TextLeadingDistribution.even,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
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
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(33, 35, 39, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ),
                          Text('or'),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        padding: EdgeInsets.all(15.h),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Don\'t have an account yet?',
                            ).lightSized(13.sp).colors(Colors.grey.shade700),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.only(left: 0, top: 10.h, bottom: 10.h),
                          child: const Icon(Icons.close, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
