import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/profile/presentation/widget/connection_info_doc.dart';

class IntroductionDoctorWidget extends StatelessWidget {
  const IntroductionDoctorWidget({
    super.key,
    required this.introduction,
    required this.time,
    required this.location,
  });
  final String introduction;
  final String time;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.introduction, style: getBodyStyle(fontSize: 15.0.sp)),
        Gap(5.0.h),
        Text(introduction, style: getSmallStyle(fontSize: 15.0.sp)),
        Gap(10.0.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          decoration: BoxDecoration(
            color: ColorApp.third,
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          child: Column(
            children: [
              CardInfoWidget(title: time, iconData: Icons.access_time_filled),
              CardInfoWidget(title: location, iconData: Icons.location_on),
            ],
          ),
        ),
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
