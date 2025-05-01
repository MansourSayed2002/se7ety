import 'package:flutter/material.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';

extension MessageBar on BuildContext {
  messageBar(String message, [Color? color]) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? ColorApp.red,
        content: Text(message, style: getSmallStyle(color: ColorApp.white)),
      ),
    );
  }
}
