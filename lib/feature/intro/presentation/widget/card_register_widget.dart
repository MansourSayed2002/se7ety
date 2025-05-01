import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

class CardRegisterWidget extends StatelessWidget {
  const CardRegisterWidget({
    super.key,
    required this.onTapDoctor,
    required this.onTapPatient,
  });
  final Function() onTapDoctor;
  final Function() onTapPatient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
      decoration: BoxDecoration(
        color: ColorApp.primery.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(25.0.r),
      ),
      child: Column(
        children: [
          Text(
            TextApp.registernow,
            style: getTitleStyle(
              color: ColorApp.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          Gap(40.0.h),
          CustomElevatedButtonGlobal(
            radius: 20.0.r,
            width: 400.w,
            title: TextApp.doctor,
            style: getBodyStyle(),
            backgroundColor: ColorApp.accentcolor.withValues(alpha: .7),
            onatp: onTapDoctor,
          ),
          Gap(10.0.h),
          CustomElevatedButtonGlobal(
            radius: 20.0.r,
            width: 400.w,
            title: TextApp.patient,
            style: getBodyStyle(),
            backgroundColor: ColorApp.accentcolor.withValues(alpha: .7),
            onatp: onTapPatient,
          ),
        ],
      ),
    );
  }
}
