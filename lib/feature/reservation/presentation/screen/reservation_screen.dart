import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/alert_confirme.dart';
import 'package:se7ety/core/extensions/message_bar.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/shared/loading_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';
import 'package:se7ety/feature/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:se7ety/feature/reservation/presentation/widget/header_card_widget.dart';
import 'package:se7ety/feature/reservation/presentation/widget/textform_page_reservation.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key, required this.doctor});
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ReservationBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TextApp.bookwithDoc,
            style: getBodyStyle(
              color: ColorApp.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<ReservationBloc, ReservationState>(
          listener: (context, state) {
            if (state is ReservationSuccess) {
              context.removeUntile(MainScreen());
              context.messageBar("تم الحجز بنجاح", Colors.green);
            } else if (state is ReservationError) {
              context.messageBar(state.message);
            } else if (state is ReservationLoading) {
              loadingWidget(context);
            }
          },
          builder: (context, state) {
            var bloc = context.read<ReservationBloc>();
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              child: CustomElevatedButtonGlobal(
                onatp: () {
                  context.alertConfirme(
                    title: TextApp.confirmeReservation,
                    content: TextApp.doYouSure,
                    onConfirme: () {
                      if (bloc.key.currentState!.validate()) {
                        bloc.add(
                          ReservationEvent(
                            doctorName: doctor.name.toString(),
                            doctorId: doctor.uid.toString(),
                            location: doctor.address.toString(),
                            token: doctor.token.toString(),
                          ),
                        );
                      }
                    },
                    onCancel: () {
                      context.pop();
                    },
                  );
                },
                radius: 10.0.r,
                title: TextApp.confirmeYourReservation,
                width: double.infinity,
              ),
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          child: CustomBody(doctor: doctor),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderCardWidget(
            image: doctor.image.toString(),
            name: doctor.name.toString(),
            rating: doctor.rating.toString(),
            speciality: doctor.specialization.toString(),
          ),
          Gap(10.0.h),
          Text(
            TextApp.enterReservationInfo,
            style: getBodyStyle(color: ColorApp.primery),
          ),
          Gap(10.0.h),
          TextformPageReservation(
            openHours: doctor.openHour.toString(),
            closeHours: doctor.closeHour.toString(),
          ),
        ],
      ),
    );
  }
}
