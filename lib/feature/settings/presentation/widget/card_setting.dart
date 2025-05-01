import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CardSetting extends StatelessWidget {
  const CardSetting({
    super.key,
    required this.iconData,
    required this.title,
    this.onTap,
  });
  final IconData iconData;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.0.h),
        decoration: BoxDecoration(
          color: ColorApp.third,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Icon(iconData),
            Gap(8.0.h),
            Text(title, style: getBodyStyle(fontSize: 15.0.sp)),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
