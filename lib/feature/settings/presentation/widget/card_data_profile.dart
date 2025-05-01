import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CardDataProfile extends StatelessWidget {
  const CardDataProfile({
    super.key,
    required this.title,
    required this.text,
    this.onTap,
  });
  final String title;
  final String text;
  final VoidCallback? onTap;
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
            Text(title, style: getBodyStyle(fontSize: 15.0.sp)),
            Spacer(),
            Text(text, style: getSmallStyle()),
          ],
        ),
      ),
    );
  }
}
