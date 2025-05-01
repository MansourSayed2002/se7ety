import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

extension AlertRating on BuildContext {
  alertRating({required void Function(double) onRatingUpdate}) => showDialog(
    context: this,
    builder:
        (context) => Container(
          margin: EdgeInsets.symmetric(vertical: 200.0.h, horizontal: 30.0.w),
          decoration: BoxDecoration(
            color: ColorApp.third,
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.0.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorApp.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0.r),
                    topRight: Radius.circular(20.0.r),
                  ),
                  image: DecorationImage(
                    image: AssetImage(ImageApp.logo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Gap(10.0.h),
              Text(TextApp.pleaseRate, style: getSmallStyle()),
              Gap(10.0.h),
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder:
                    (context, _) => Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: onRatingUpdate,
              ),
            ],
          ),
        ),
  );
}
