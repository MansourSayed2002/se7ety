import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/color_app.dart';

class CustomButtomPhone extends StatelessWidget {
  const CustomButtomPhone({
    super.key,
    required this.number,
    required this.onTap,
    this.icon,
  });
  final int number;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 13.0.h),
        decoration: BoxDecoration(
          color: ColorApp.third,
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        child: Row(
          children: [
            icon == null ? Text("$number") : SizedBox(),
            Icon(icon ?? Icons.phone, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
