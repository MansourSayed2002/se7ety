import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.title, this.width});
  final String title;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImageApp.noSearch, width: width ?? 200.0.w),
          Text(title, style: getBodyStyle(fontSize: 15.0.sp)),
        ],
      ),
    );
  }
}
