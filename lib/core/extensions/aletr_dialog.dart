import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/settings/presentation/screen/update_Profile_screen.dart';

extension AletrDialog on BuildContext {
  alertDialod({
    required String title,
    required TextEditingController controller,
    required String key,
  }) => showDialog(
    context: this,
    builder:
        (context) => SimpleDialog(
          backgroundColor: ColorApp.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 13.0.w,
            vertical: 13.0.h,
          ),
          title: Center(child: Text(title, style: getSmallStyle())),
          children: [
            CustomTextFromGlobal(hinttext: title, controller: controller),
            Gap(7.0.h),
            CustomElevatedButtonGlobal(
              onatp: () async {
                await FirebaseFirestore.instance
                    .collection("patient")
                    .doc(LocalStorageApp.getData("uid"))
                    .update({key: controller.text})
                    .then((value) {
                      pop();
                      pushRepalceMent(UpdateProfileScreen());
                    });
              },
              radius: 10.0.r,
              title: TextApp.update,
            ),
          ],
        ),
  );
}
