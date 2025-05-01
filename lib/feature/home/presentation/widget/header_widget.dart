import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(TextApp.hello, style: getSmallStyle()),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: getSmallStyle(color: ColorApp.primery),
            ),
          ],
        ),
        Gap(10.0.h),
        Text(TextApp.headHome, style: getTitleStyle(fontSize: 23.0.sp)),
      ],
    );
  }
}
