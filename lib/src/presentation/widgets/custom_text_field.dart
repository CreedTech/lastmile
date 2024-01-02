import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastmile/src/core/core.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String legend;
  final TextEditingController controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;
  final String? errorText;
  final void Function(String)? onChanged;
  // final String? successMessage;
  final bool willContainPrefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    this.labelText = "",
     this.hintText,
    required this.controller,
    this.icon,
    this.prefixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.name,
    this.validator,
    this.errorText,
    this.onChanged,
    required this.legend,
    // this.successMessage,
    this.willContainPrefix = false,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Text(
            labelText!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          // enableInteractiveSelection: enableInteractiveSelection,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: true,
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          inputFormatters: inputFormatters,
          style: GoogleFonts.nunito(
            fontSize: 14.sp,
            color: colorsBlack,
          ),

          decoration: InputDecoration(
            labelText: legend,
            labelStyle: GoogleFonts.nunito(color: colorGray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
              borderSide: const BorderSide(color: Color(0xffA4A5A6)),
            ),
            // enabledBorder: Color(value),
            prefixIcon: prefixIcon,
            hintText: hintText,
            errorStyle: GoogleFonts.nunito(
                fontSize: 12.sp, fontWeight: FontWeight.w600),
            hintStyle: GoogleFonts.nunito(color: textGray),
            errorText: errorText,
            suffixIcon: icon,
            filled: false,
            // fillColor: colorGray,
            contentPadding: EdgeInsets.all(14.sp),
          ),
          maxLines: 1,
          validator: validator,
          //  onChanged: onChanged,
        ),
      ],
    );
  }
}
