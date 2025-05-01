import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/net_work_image_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/doctor/profile/presentation/screen/doctor_details.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctors});
  final DoctorModel doctors;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(DoctorDetailsScreen(doctors: doctors));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          color: ColorApp.third,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0.r),
              child: ImageProfileWidget(imagePath: doctors.image.toString()),
            ),
            Gap(10.0.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctors.name.toString(),
                    style: getBodyStyle(
                      color: ColorApp.primery,
                      fontSize: 18.0.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    doctors.specialization.toString(),
                    style: getSmallStyle(fontSize: 15.0.sp),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text(doctors.rating.toString(), style: getSmallStyle()),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
