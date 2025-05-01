import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/doctor/appointment/presentation/widget/custom_buttons_done_and_delete.dart';
import 'package:se7ety/feature/my_appointment/data/model/appointment_model.dart';
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
        "${appointmentModel.patientName}",
        style: getBodyStyle(color: ColorApp.primery),
      ),
      subtitle: TimeAndDateWidget(
        date: appointmentModel.date.toString(),
        time: appointmentModel.time.toString(),
      ),
      children: [
        Text(
          appointmentModel.patientDescription.toString(),
          style: getBodyStyle(),
        ),
        Gap(10.0.h),
        CustomButtonsDoneAndDelete(document: document),
        Gap(10.0.h),
      ],
    );
  }
}
