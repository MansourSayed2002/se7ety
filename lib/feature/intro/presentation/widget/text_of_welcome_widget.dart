import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class TextOfWelcomeWidget extends StatelessWidget {
  const TextOfWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextApp.welcome,
          style: getTitleStyle(color: ColorApp.primery, fontSize: 45.0.sp),
        ),
        Gap(15.0.h),
        Text(TextApp.welbody, style: getSmallStyle()),
      ],
    );
  }
}
