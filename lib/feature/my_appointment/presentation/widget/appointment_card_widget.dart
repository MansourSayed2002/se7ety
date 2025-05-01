import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/alert_confirme.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/function/time_filtter.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';
import 'package:se7ety/feature/my_appointment/data/model/appointment_model.dart';
import 'package:se7ety/feature/my_appointment/data/repo/appointment_repo.dart';
import 'package:se7ety/feature/my_appointment/presentation/widget/time_and_date_reservation.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({
    super.key,
    required this.appointmentModel,
    required this.document,
  });
  final AppointmentModel appointmentModel;
  final String document;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "${appointmentModel.doctorName}",
        style: getBodyStyle(color: ColorApp.primery),
      ),
      subtitle: TimeAndDateWidget(
        date: appointmentModel.date.toString(),
        time: timeFiltter(appointmentModel.time.toString()),
      ),
      children: [
        Row(
          children: [
            Icon(Icons.person, color: ColorApp.primery),
            Gap(8.0.w),
            Text(
              "اسم المريض : ${appointmentModel.patientName}",
              style: getSmallStyle(fontSize: 15.0.sp),
            ),
          ],
        ),
        Gap(10.0.h),
        Row(
          children: [
            Icon(Icons.location_on, color: ColorApp.primery),
            Gap(8.0.w),
            Text(
              "${appointmentModel.location}",
              style: getBodyStyle(fontSize: 15.0.sp),
            ),
          ],
        ),
        Gap(20.0.h),
        CustomElevatedButtonGlobal(
          height: 40.0.h,
          width: double.infinity,
          title: TextApp.deletereseve,
          backgroundColor: ColorApp.red,
          onatp: () {
            context.alertConfirme(
              title: TextApp.deleteappointment,
              content: TextApp.areyoudeleteappointment,
              onConfirme: () {
                AppointmentRepo.deleteAppointment(document);
                context.removeUntile(MainScreen());
              },
              onCancel: () {
                context.pop();
              },
            );
          },
        ),
        Gap(10.0.h),
      ],
    );
  }
}
