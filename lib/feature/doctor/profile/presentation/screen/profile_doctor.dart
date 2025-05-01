import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_loading_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/doctor/profile/data/repo/doctor_profile_repo.dart';
import 'package:se7ety/feature/doctor/profile/presentation/widget/connection_info_doctor.dart';
import 'package:se7ety/feature/doctor/profile/presentation/widget/doc_reservtion_widget.dart';
import 'package:se7ety/feature/profile/presentation/widget/header_widget.dart';
import 'package:se7ety/feature/profile/presentation/widget/introduction_widget.dart';
import 'package:se7ety/feature/settings/presentation/screen/setting_screen.dart';

class ProfileDoctorScreen extends StatelessWidget {
  const ProfileDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.profile,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              context.push(SettingScreen());
            },
            icon: Icon(Icons.settings),
            color: ColorApp.white,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
        child: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DoctorProfileRepo.getProfileData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomLoadingWidget();
        }
        DoctorModel doctorModel = DoctorModel.formJson(snapshot.data!.data()!);
        if (snapshot.data!.data()!.isNotEmpty) {
          
        }
        return snapshot.data!.data()!.isNotEmpty
            ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    image: doctorModel.image.toString(),
                    name: doctorModel.name.toString(),
                    address: doctorModel.address.toString(),
                  ),
                  Gap(20.0.h),
                  IntroductionWidget(introduction: doctorModel.bio.toString()),
                  ConnectionInfoDoctor(
                    email: doctorModel.email.toString(),
                    phone1: doctorModel.phone1.toString(),
                    phone2: doctorModel.phone2.toString(),
                  ),
                  Divider(
                    color: ColorApp.grey,
                    endIndent: 10.0.w,
                    indent: 10.0.w,
                    height: 40.0.h,
                  ),
                  Text(
                    TextApp.myReservation,
                    style: getBodyStyle(fontSize: 15.0.sp),
                  ),
                  DocReservtionWidget(),
                ],
              ),
            )
            : Center(child: Text("No Data"));
      },
    );
  }
}
