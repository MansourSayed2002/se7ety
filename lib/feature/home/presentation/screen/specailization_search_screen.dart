import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/doctor_card.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/home/data/repo/home_repo.dart';

class SpecailizationSearchScreen extends StatelessWidget {
  const SpecailizationSearchScreen({super.key, required this.specialization});
  final String specialization;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          specialization,
          style: getTitleStyle(color: ColorApp.white),
        ),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: HomeRepo.getDoctorsThroughSpecialization(specialization),
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
                itemCount: snapshot.data!.docs.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var doctors = DoctorModel.formJson(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>,
                  );
                  return DoctorCard(doctors: doctors);
                },
              )
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageApp.noSearch, width: 200.0.w),
                    Text(
                      TextApp.noDoctor,
                      style: getBodyStyle(fontSize: 15.0.sp),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
