import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../auth/login/view/forgot_password_view.dart';
import '../../auth/login/view/reset_password_view.dart';

class MyInformationView extends StatefulWidget {
  const MyInformationView({super.key});

  @override
  State<MyInformationView> createState() => _MyInformationViewState();
}

class _MyInformationViewState extends State<MyInformationView> {
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
          'My Information',
        ).boldSized(22.sp).colors(colorsBlack),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w, bottom: 32.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.person_outline,
                  color: colorsBlack,
                ),
                title: Text(
                  'Solomon',
                  style: GoogleFonts.nunito(
                    color: colorsBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.mail_outline,
                  color: colorsBlack,
                ),
                title: Text(
                  'natureboyyy21@gmail.com',
                  style: GoogleFonts.nunito(
                    color: colorsBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // onTap: () {
                //   Navigator.pushNamed(context, my_information);
                // },
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: colorGray,
                //   size: 20.sp,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.lock_outline,
                  color: colorsBlack,
                ),
                title: Text(
                  'Change Password',
                  style: GoogleFonts.nunito(
                    color: colorsBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordView(),
                    ),
                  );
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorGray,
                  size: 20.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.phone_android_outlined,
                  color: colorsBlack,
                ),
                title: Text(
                  'Change Phone Number',
                  style: GoogleFonts.nunito(
                    color: colorsBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, change_phone_number);
                },
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: colorGray,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
