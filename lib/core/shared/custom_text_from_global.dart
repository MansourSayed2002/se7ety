import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CustomTextFromGlobal extends StatelessWidget {
  const CustomTextFromGlobal({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.hintTextDirection,
    this.height,
    this.readOnly,
    this.maxLines,
  });
  final String hinttext;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final TextDirection? hintTextDirection;
  final bool? readOnly;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 56.0.h,
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        obscureText: obscureText ?? false,
        cursorColor: ColorApp.primery,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: ColorApp.third,
          hintText: hinttext,
          hintTextDirection: hintTextDirection ?? TextDirection.rtl,
          hintStyle: getSmallStyle(color: ColorApp.grey, fontSize: 15.0.sp),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0.r),
            borderSide: BorderSide(color: ColorApp.third),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0.r),
            borderSide: BorderSide(color: ColorApp.third),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0.r),
            borderSide: BorderSide(color: ColorApp.third),
          ),
          // errorBorder: OutlineInputBorder(
          //   gapPadding: 20.0,
          //   borderSide: BorderSide(color: ColorApp.red),
          //   borderRadius: BorderRadius.circular(25.0.r),
          // ),
        ),
      ),
    );
  }
}
