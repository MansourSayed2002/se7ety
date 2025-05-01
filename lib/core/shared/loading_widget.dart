import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';

loadingWidget(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(child: Lottie.asset(ImageApp.loading)),
  );
}
