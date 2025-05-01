import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key, required this.introduction});
  final String introduction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.introduction, style: getBodyStyle(fontSize: 15.0.sp)),
        Gap(10.0.h),
        Text(introduction, style: getSmallStyle(fontSize: 15.0.sp)),
        Divider(
          color: ColorApp.grey,
          endIndent: 10.0.w,
          indent: 10.0.w,
          height: 30.0.h,
        ),
      ],
    );
  }
}
