import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/shared/net_work_image_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.name,
    required this.address,
    required this.image,
  });
  final String name;
  final String address;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0.r),
          child: ImageProfileWidget(
            imagePath: image,
            height: 100.0.h,
            width: 100.w,
          ),
        ),
        Gap(10.0.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: getBodyStyle(color: ColorApp.primery)),
              Text(address, style: getSmallStyle()),
            ],
          ),
        ),
      ],
    );
  }
}
