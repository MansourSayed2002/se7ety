import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/class/notifications_app.dart';
import 'package:se7ety/core/constants/enum/status_request.dart';
import 'package:se7ety/feature/reservation/data/repo/reservation_repo.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) async {
      await reservation(event, emit);
    });
  }
  List times = [];
  var key = GlobalKey<FormState>();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientPhone = TextEditingController();
  TextEditingController patientDescription = TextEditingController();
  TextEditingController patientDate = TextEditingController();
  TextEditingController patientTime = TextEditingController();

  reservation(event, emit) async {
    emit(ReservationLoading());
    var response = await ReservationRepo.reservationDone({
      "patientId": LocalStorageApp.getData("uid"),
      "doctorId": event.doctorId,
      "doctorName": event.doctorName,
      "patientName": patientName.text,
      "patientPhone": patientPhone.text,
      "patientDescription": patientDescription.text,
      "date": patientDate.text,
      "location": event.location,
      "time": patientTime.text,
      "rating": 0,
      "isDone": false,
    });
    if (response == StatusRequest.success) {
      NotificationsApp.sendNotification(
        token: event.token,
        title: "تم الحجز ",
        body: "قام ${patientName.text}بحجز موعد مع معك",
      );
      emit(ReservationSuccess());
    } else {
      emit(ReservationError("Some thing is wrong"));
    }
  }
}
