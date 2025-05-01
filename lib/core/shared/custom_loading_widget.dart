import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100.0.w,
        child: Lottie.asset(ImageApp.loading),
      ),
    );
  }
}
