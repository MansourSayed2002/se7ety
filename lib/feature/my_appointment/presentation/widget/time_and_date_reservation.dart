import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/function/time_filtter.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class TimeAndDateWidget extends StatelessWidget {
  const TimeAndDateWidget({super.key, required this.date, required this.time});
  final String date;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_month, color: ColorApp.primery),
            Gap(8.0.w),
            Text(date, style: getBodyStyle(fontSize: 15.0.sp)),
            Gap(8.0.w),
            Text(
              compareDate(date) ? "اليوم" : "",
              style: getSmallStyle(color: Colors.green, fontSize: 15.0.sp),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.access_time, color: ColorApp.primery),
            Gap(8.0.w),
            Text(time, style: getBodyStyle(fontSize: 15.0.sp)),
          ],
        ),
        Gap(20.0.h),
      ],
    );
  }
}


    //  
    //     InkWell(
    //       onTap: () {},
    //       child: Container(
    //         padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
    //         decoration: BoxDecoration(
    //           color: ColorApp.red,
    //           borderRadius: BorderRadius.circular(8.0.r),
    //         ),
    //         child: Text(
    //           "حذف الحجز",
    //           style: getSmallStyle(color: ColorApp.white),
    //         ),
    //       ),
    //     ),