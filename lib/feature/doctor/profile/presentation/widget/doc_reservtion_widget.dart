import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/doctor/profile/data/repo/doctor_profile_repo.dart';
import 'package:se7ety/feature/my_appointment/data/model/appointment_model.dart';
import 'package:se7ety/feature/my_appointment/presentation/widget/time_and_date_reservation.dart';

class DocReservtionWidget extends StatelessWidget {
  const DocReservtionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DoctorProfileRepo.getAppointment(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 100.0.w,
              child: Lottie.asset(ImageApp.loading),
            ),
          );
        }
        return snapshot.data!.docs.isNotEmpty
            ? ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                AppointmentModel appointmentModel = AppointmentModel.fromJson(
                  snapshot.data!.docs[index].data() as Map<String, dynamic>,
                );
                return ExpansionTile(
                  title: Text(
                    "${appointmentModel.doctorName}",
                    style: getBodyStyle(color: ColorApp.primery),
                  ),
                  subtitle: TimeAndDateWidget(
                    date: appointmentModel.date.toString(),
                    time: appointmentModel.time.toString(),
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
                  ],
                );
              },
            )
            : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageApp.noSearch, width: 200.0.w),
                  Text(
                    "لا يوجد حجوزات",
                    style: getBodyStyle(fontSize: 15.0.sp),
                  ),
                ],
              ),
            );
      },
    );
  }
}
