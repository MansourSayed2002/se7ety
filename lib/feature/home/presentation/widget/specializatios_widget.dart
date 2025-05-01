import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/specialization_doc.dart';
import 'package:se7ety/feature/home/presentation/screen/specailization_search_screen.dart';

class SpecializatiosWidget extends StatelessWidget {
  const SpecializatiosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextApp.specializations,
          style: getSmallStyle(
            color: ColorApp.primery,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10.0.h),
        SizedBox(
          height: 180.0.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: specialization.length,
            itemBuilder:
                (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      SpecailizationSearchScreen(
                        specialization: specialization[index],
                      ),
                    );
                  },
                  child: Container(
                    width: 140.0.w,
                    margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                    decoration: BoxDecoration(
                      color: specializationColor[index],
                      borderRadius: BorderRadius.circular(20.0.r),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -25.0.w,
                          top: -25.0.h,
                          child: CircleAvatar(
                            backgroundColor: ColorApp.third.withValues(
                              alpha: .3,
                            ),
                            radius: 50.0.r,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                ImageApp.doctorCard,
                                width: 130.0.w,
                              ),
                              Text(
                                specialization[index],
                                textAlign: TextAlign.center,
                                style: getSmallStyle(
                                  color: ColorApp.white,
                                  fontSize: 16.0.sp,
                                ),
                              ),
                              Gap(10.0.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
