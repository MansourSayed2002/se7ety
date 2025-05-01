import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/intro/data/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorAndButton extends StatelessWidget {
  const SmoothIndicatorAndButton({
    super.key,
    required this.controller,
    this.onDotClicked,
    required this.onTapButton,
    required this.index,
  });
  final void Function(int)? onDotClicked;
  final PageController controller;
  final Function() onTapButton;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: onboardingPages.length,
          effect: ScrollingDotsEffect(
            activeDotColor: ColorApp.primery,
            dotWidth: 17.0.w,
            dotHeight: 13.0.h,
          ),
          onDotClicked: onDotClicked,
        ),
        AnimatedCrossFade(
          firstChild: SizedBox(),
          secondChild: CustomElevatedButtonGlobal(
            width: 100.0.w,
            radius: 15.0.r,
            onatp: onTapButton,
            title: TextApp.letsGo,
          ),
          crossFadeState: showButton(index),
          duration: Duration(milliseconds: 400),
        ),
      ],
    );
  }

  showButton(index) {
    if (index == onboardingPages.length - 1) {
      return CrossFadeState.showSecond;
    } else {
      return CrossFadeState.showFirst;
    }
  }
}
