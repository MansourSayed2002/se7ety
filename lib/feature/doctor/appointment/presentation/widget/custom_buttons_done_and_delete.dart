import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/doctor/appointment/data/repo/appointment_doc_repo.dart';
import 'package:se7ety/feature/doctor/main/presentation/main_doc_screen.dart';

class CustomButtonsDoneAndDelete extends StatelessWidget {
  const CustomButtonsDoneAndDelete({super.key, required this.document});
  final String document;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButtonGlobal(
            height: 40.0.h,
            width: double.infinity,
            title: TextApp.delete,
            backgroundColor: ColorApp.red,
            onatp: () {
              AppointmentDocRepo.deleteAppointment(document);
              context.removeUntile(MainDocScreen());
            },
          ),
        ),
        Gap(10.0.w),
        Expanded(
          child: CustomElevatedButtonGlobal(
            height: 40.0.h,
            width: double.infinity,
            title: TextApp.done,
            backgroundColor: Colors.green,
            onatp: () {
              AppointmentDocRepo.doneAppointment(document);
              context.removeUntile(MainDocScreen());
            },
          ),
        ),
      ],
    );
  }
}
