import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lastmile/src/presentation/auth/login/view/change_phone_otp_view.dart';

import '../../../../core/core.dart';

class ChangePhoneNumber extends StatefulWidget {
  const ChangePhoneNumber({super.key});

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final changePhoneFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

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
            Icons.arrow_back,
            color: colorsBlack,
          ),
        ),
        title: Text(
          'Phone Number',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Form(
            key: changePhoneFormKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: IntlPhoneField(
                        initialCountryCode: 'NG',
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Enter your Number',
                          labelStyle: GoogleFonts.nunito(color: colorGray),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.sp),
                            borderSide:
                                const BorderSide(color: Color(0xffA4A5A6)),
                          ),
                          errorStyle: GoogleFonts.nunito(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                          hintStyle: GoogleFonts.nunito(color: textGray),
                          filled: false,
                          contentPadding: EdgeInsets.all(14.sp),
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ),
                    Text(
                        'We will send a verification code to your number to confirm its you'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 48.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePhoneOtpView(
                            phone_number: _phoneNumberController.text,
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
                        borderRadius: BorderRadius.all(Radius.circular(88.sp)),
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
