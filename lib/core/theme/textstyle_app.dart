import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/color_app.dart';

getTitleStyle({Color? color, FontWeight? fontWeight, double? fontSize}) =>
    TextStyle(
      fontSize: fontSize ?? 24.0.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ColorApp.black,
    );

getBodyStyle({Color? color, FontWeight? fontWeight, double? fontSize}) =>
    TextStyle(
      fontSize: fontSize ?? 20.0.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? ColorApp.black,
    );

getSmallStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
}) => TextStyle(
  fontSize: fontSize ?? 18.0.sp,
  fontWeight: fontWeight ?? FontWeight.w400,
  color: color ?? ColorApp.black,
  height: height,
);
