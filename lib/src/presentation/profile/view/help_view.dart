import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../widgets/custom_text_field.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final helpFormKey = GlobalKey<FormState>();
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
          'Help',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo_single.png',
                    height: 100.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 29.h),
                  child: Text(
                    'We’d love to hear from you, we’ll get back to you as soon as possible',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Form(
                  key: helpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        legend: 'Name',
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid name';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        // prefixIcon: Icon(
                        //   Icons.mail_outline,
                        //   color: colorsBlack,
                        // ),
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: TextFormField(
                          minLines: 3,
                          keyboardType: TextInputType.multiline,
                          controller: _messageController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter your message here...',
                          ),
                          // labelText: 'Email Address',
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h, top: 24.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Head Office',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Area 1 Abuja, Nigeria',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: colorGray),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h, top: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Phone number',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                'Mon - Fri 9:00 - 6:00',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '08031359239',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: colorGray,
                            ),
                          ),
                          Text(
                            '08031359239',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: colorGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      if (helpFormKey.currentState!.validate()) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          home,
                          (route) => false,
                        );
                      }
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
                        'Submit',
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
