import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class ConnectionInfoDoc extends StatelessWidget {
  const ConnectionInfoDoc({
    super.key,
    required this.email,
    required this.phone,
  });
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextApp.contactInformation,
          style: getBodyStyle(fontSize: 15.0.sp),
        ),
        Gap(10.0.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          decoration: BoxDecoration(
            color: ColorApp.third,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              CardInfoWidget(iconData: Icons.mail, title: email),
              CardInfoWidget(iconData: Icons.phone, title: phone),
            ],
          ),
        ),
       
      ],
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorApp.primery,
            ),
            child: Icon(iconData, color: Colors.white),
          ),
          Gap(10.0.h),
          Expanded(child: Text(title, style: getSmallStyle(fontSize: 16.0.sp))),
        ],
      ),
    );
  }
}
