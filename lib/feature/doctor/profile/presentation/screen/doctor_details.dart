import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/function/url_launcher.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/doctor/profile/presentation/widget/introduction_doctor_widget.dart';
import 'package:se7ety/feature/map/presentation/screen/go_place_map_screen.dart';
import 'package:se7ety/feature/profile/presentation/widget/connection_info_doc.dart';
import 'package:se7ety/feature/profile/presentation/widget/profile_header.dart';
import 'package:se7ety/feature/reservation/presentation/screen/reservation_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctors});
  final DoctorModel doctors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.doctorInfo,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: CustomElevatedButtonGlobal(
          onatp: () {
            context.push(ReservationScreen(doctor: doctors));
          },
          radius: 10.0.r,
          title: TextApp.bookAppointmentNow,
          width: double.infinity,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
        child: CustomBody(doctors: doctors),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.doctors});
  final DoctorModel doctors;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(
            image: doctors.image.toString(),
            rating: doctors.rating.toString(),
            name: doctors.name.toString(),
            speciality: doctors.specialization.toString(),
            onPhoneOne: () {
              urlLaunch("tel:${doctors.phone1.toString()}");
            },
            onPhoneTwo: () {
              urlLaunch("tel:${doctors.phone2.toString()}");
            },
            onLocation: () {
              context.push(
                GoPlaceMapScreen(
                  latLngdoc: LatLng(
                    doctors.lat!.toDouble(),
                    doctors.long!.toDouble(),
                  ),
                ),
              );
            },
          ),
          Gap(10.0.h),
          IntroductionDoctorWidget(
            introduction: doctors.bio.toString(),
            location: doctors.address.toString(),
            time: "${doctors.openHour} - ${doctors.closeHour}",
          ),
          ConnectionInfoDoc(
            email: doctors.email.toString(),
            phone: doctors.phone1.toString(),
          ),
        ],
      ),
    );
  }
}
