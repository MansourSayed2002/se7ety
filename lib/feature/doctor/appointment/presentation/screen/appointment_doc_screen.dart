import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/custom_loading_widget.dart';
import 'package:se7ety/core/shared/no_data_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/doctor/appointment/data/repo/appointment_doc_repo.dart';
import 'package:se7ety/feature/doctor/appointment/presentation/widget/appointment_card_widget.dart';
import 'package:se7ety/feature/my_appointment/data/model/appointment_model.dart';

class AppointmentDocScreen extends StatelessWidget {
  const AppointmentDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.timeReser,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(17.0), child: CustomBody()),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppointmentDocRepo.getAppointment(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return CustomLoadingWidget();
        }
        return snapshot.data!.docs.isNotEmpty
            ? ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                AppointmentModel appointmentModel = AppointmentModel.fromJson(
                  snapshot.data!.docs[index].data() as Map<String, dynamic>,
                );
                return AppointmentCardWidget(
                  appointmentModel: appointmentModel,
                  document: snapshot.data!.docs[index].id,
                );
              },
            )
            : NoDataWidget(title: "لا يوجد حجوزات");
      },
    );
  }
}
