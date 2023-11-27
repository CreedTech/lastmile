import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/view/phone_number_otp_view.dart';
import 'package:lastmile/src/presentation/widgets/custom_text_field.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final phoneFormKey = GlobalKey<FormState>();
  // GlobalKey<FormState> _formKey = GlobalKey();

  // FocusNode focusNode = FocusNode();

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
          'Create Account',
        ).boldSized(16.sp).colors(colorsBlack),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150.h,
                ),
                Form(
                  key: phoneFormKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xffA4A5A6), width: 1),
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child: CountryCodePicker(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          boxDecoration: BoxDecoration(
                            // border: Border.all(color: Colors.blue, width: 2.0),
                            shape: BoxShape.rectangle,
                          ),
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'NG',
                          showFlagMain: true,
                          alignLeft: true,
                          favorite: const ['+234', 'NG'],
                          // countryFilter: const ['IT', 'FR'],
                          showFlagDialog: true,
                          showDropDownButton: true,
                          comparator: (a, b) => b.name!.compareTo(a.name!),
                          flagDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      CustomTextField(
                        hintText: 'Phone Number',
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input a valid phone number';
                          }
                          if (value.length < 11) {
                            return 'Digits must be more than 11';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text('We will send a verification code to your number to confirm its you')
                          .normalSized(12.sp)
                          .colors(colorsBlack),
                      SizedBox(
                        height: 35.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     phone_number_otp, (route) => false,
                          //     arguments: {_phoneNumberController.text.trim()});
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneNumberOtpView(
                                      phone_number:
                                          _phoneNumberController.text.trim())));
                          // if (phoneFormKey.currentState!.validate()) {
                          // authState.signIn(
                          //     context,
                          //     _emailController.text.trim(),
                          // _passwordController.text.trim());
                          // }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(33, 35, 39, 1),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            'Continue',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      home,
                      (route) => false,
                    );
                    // if (phoneFormKey.currentState!.validate()) {
                    // authState.signIn(
                    //     context,
                    //     _emailController.text.trim(),
                    // _passwordController.text.trim());
                    // }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Color(0xffA4A5A6), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outline),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Continue with email',
                          style: TextStyle(fontSize: 14.sp, color: colorsBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
