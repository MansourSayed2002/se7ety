import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/profile/presentation/widget/connection_info_doc.dart';

class ConnectionInfoDoctor extends StatelessWidget {
  const ConnectionInfoDoctor({
    super.key,
    required this.email,
    required this.phone1,
    required this.phone2,
  });
  final String email;
  final String phone1;
  final String phone2;
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
              CardInfoWidget(iconData: Icons.phone, title: phone1),
              CardInfoWidget(iconData: Icons.phone, title: phone2),
            ],
          ),
        ),
      ],
    );
  }
}
