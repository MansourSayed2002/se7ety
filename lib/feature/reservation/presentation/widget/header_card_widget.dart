import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/shared/net_work_image_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class HeaderCardWidget extends StatelessWidget {
  const HeaderCardWidget({
    super.key,
    required this.image,
    required this.rating,
    required this.name,
    required this.speciality,
  });
  final String image;
  final String rating;
  final String name;
  final String speciality;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
      decoration: BoxDecoration(
        color: ColorApp.third,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: -15.0.w,
            bottom: -15.0.h,
            child: Icon(Icons.access_time, color: ColorApp.white, size: 80.0),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0.r),
                child: ImageProfileWidget(
                  imagePath: image,
                  width: 130.0.w,
                  height: 130.0.h,
                ),
              ),
              Gap(20.0.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle(color: ColorApp.primery),
                    ),
                    Gap(8.0.h),
                    Text(speciality, style: getSmallStyle(fontSize: 15.0.sp)),
                    Gap(8.0.h),
                    Row(
                      children: [
                        Text(rating),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
