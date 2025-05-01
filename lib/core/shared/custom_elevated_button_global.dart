import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CustomElevatedButtonGlobal extends StatelessWidget {
  const CustomElevatedButtonGlobal({
    super.key,
    required this.onatp,
    required this.title,
    this.width,
    this.radius,
    this.height,
    this.backgroundColor,
    this.style,
  });
  final Function() onatp;
  final String title;
  final double? width;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 56.0.h,
      child: ElevatedButton(
        onPressed: onatp,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorApp.primery,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 25.0.r),
          ),
        ),
        child: Text(
          title,
          style:
              style ??
              getSmallStyle(color: ColorApp.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
