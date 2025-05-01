import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/alert_confirme.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';
import 'package:se7ety/feature/my_appointment/data/model/appointment_model.dart';
import 'package:se7ety/feature/my_appointment/data/repo/appointment_repo.dart';
import 'package:se7ety/feature/my_appointment/presentation/widget/time_and_date_reservation.dart';
import 'package:se7ety/feature/profile/data/repo/profile_repo.dart';

class MyRservationWidget extends StatelessWidget {
  const MyRservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileRepo.getAppointment(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
                            AppointmentRepo.deleteAppointment(
                              snapshot.data!.docs[index].id,
                            );
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
