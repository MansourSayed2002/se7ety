import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/shared/net_work_image_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/profile/presentation/widget/custom_buttom_phone.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.image,
    required this.rating,
    required this.name,
    required this.speciality,
    required this.onPhoneOne,
    required this.onPhoneTwo,
    required this.onLocation,
  });
  final String image;
  final String rating;
  final String name;
  final String speciality;
  final VoidCallback onPhoneOne;
  final VoidCallback onPhoneTwo;
  final VoidCallback onLocation;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                children: [Text(rating), Icon(Icons.star, color: Colors.amber)],
              ),
              Gap(8.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtomPhone(number: 1, onTap: onPhoneOne),
                  Gap(10.0.w),
                  CustomButtomPhone(number: 2, onTap: onPhoneTwo),
                  Gap(10.0.w),
                  CustomButtomPhone(
                    icon: Icons.location_pin,
                    number: 3,
                    onTap: onLocation,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
