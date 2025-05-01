import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/doctor_card.dart';
import 'package:se7ety/core/shared/no_data_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/home/data/repo/home_repo.dart';

class TopRatingDocWidget extends StatelessWidget {
  const TopRatingDocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextApp.topRating,
          style: getSmallStyle(
            color: ColorApp.primery,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(10.0.h),
        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: HomeRepo.getDoctorsRating(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return SizedBox(
                width: 100.0.w,
                child: Lottie.asset(ImageApp.loading),
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
                : NoDataWidget(title: TextApp.noData);
          },
        ),
      ],
    );
  }
}
