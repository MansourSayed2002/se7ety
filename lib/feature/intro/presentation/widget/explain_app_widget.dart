import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/intro/data/model/onboarding_model.dart';

class ExplainAppWidget extends StatelessWidget {
  const ExplainAppWidget({
    super.key,
    required this.controller,
    this.onPageChanged,
  });
  final PageController controller;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      itemCount: onboardingPages.length,
      itemBuilder:
          (context, index) => Column(
            children: [
              SvgPicture.asset(onboardingPages[index].image, width: 280.0.w),
              Gap(30.0.h),
              Text(
                onboardingPages[index].title,
                style: getBodyStyle(color: ColorApp.primery),
              ),
              Gap(25.0.h),
              Text(
                onboardingPages[index].description,
                textAlign: TextAlign.center,
                style: getSmallStyle(height: 2.h),
              ),
            ],
          ),
    );
  }
}
