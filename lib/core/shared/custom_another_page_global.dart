import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CustomAnotherPageGlobal extends StatelessWidget {
  const CustomAnotherPageGlobal({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.ontap,
  });
  final String textone;
  final String texttwo;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone, style: getSmallStyle(fontSize: 15.sp)),
        Gap(8.0.w),
        InkWell(
          onTap: ontap,
          child: Text(
            texttwo,
            style: getSmallStyle(color: ColorApp.primery, fontSize: 15.0.sp),
          ),
        ),
      ],
    );
  }
}
