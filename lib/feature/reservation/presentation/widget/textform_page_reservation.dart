import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/function/time_allowed_of_reservation.dart';
import 'package:se7ety/core/function/validation.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/reservation/presentation/bloc/reservation_bloc.dart';

class TextformPageReservation extends StatefulWidget {
  const TextformPageReservation({
    super.key,
    required this.openHours,
    required this.closeHours,
  });
  final String openHours;
  final String closeHours;

  @override
  State<TextformPageReservation> createState() =>
      _TextformPageReservationState();
}

class _TextformPageReservationState extends State<TextformPageReservation> {
  int selectHour = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        var bloc = context.read<ReservationBloc>();
        return Form(
          key: bloc.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextApp.patientName,
                style: getSmallStyle(fontSize: 15.0.sp),
              ),
              Gap(8.0.h),
              CustomTextFromGlobal(
                controller: bloc.patientName,
                hinttext: TextApp.name,
                validator: (value) {
                  return validationField("text", 3, 30, value);
                },
              ),
              Gap(10.0.h),
              Text(TextApp.phone, style: getSmallStyle(fontSize: 15.0.sp)),
              Gap(8.0.h),
              CustomTextFromGlobal(
                controller: bloc.patientPhone,
                hinttext: TextApp.phone,
                validator: (value) {
                  return validationField("phone", 11, 11, value);
                },
              ),
              Gap(10.0.h),
              Text(
                TextApp.descriptionOfSituation,
                style: getSmallStyle(fontSize: 15.0.sp),
              ),
              Gap(8.0.h),
              SizedBox(
                height: 200.0.h,
                child: CustomTextFromGlobal(
                  controller: bloc.patientDescription,
                  hinttext: TextApp.descriptionOfSituation,
                  maxLines: 200,
                  validator: (value) {
                    return validationField("text", 10, 100, value);
                  },
                ),
              ),
              Gap(10.0.h),
              Text(
                TextApp.descriptionOfSituation,
                style: getSmallStyle(fontSize: 15.0.sp),
              ),
              Gap(8.0.h),
              CustomTextFromGlobal(
                controller: bloc.patientDate,
                hinttext: TextApp.date,
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3000),
                    );
                    if (date != null) {
                      setState(() {
                        bloc.patientDate.text = DateFormat(
                          'yyyy-MM-dd',
                        ).format(date);
                        bloc.times = timeAllowedOfReservation(
                          date,
                          widget.openHours,
                          widget.closeHours,
                        );
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_month),
                ),
              ),
              Gap(10.0.h),
              Text(
                TextApp.reservationTime,
                style: getSmallStyle(fontSize: 15.0.sp),
              ),
              Gap(8.0.h),
              Wrap(
                spacing: 8.0.w,
                children:
                    bloc.times
                        .map(
                          (hour) => ChoiceChip(
                            backgroundColor: ColorApp.third,
                            selected: selectHour == hour,
                            selectedColor: ColorApp.primery,
                            label: Text(
                              "${hour > 10 ? hour : "0$hour"}:00",
                              style: getSmallStyle(
                                fontSize: 15.0.sp,
                                color:
                                    selectHour == hour
                                        ? ColorApp.white
                                        : ColorApp.black,
                              ),
                            ),
                            onSelected: (value) {
                              setState(() {
                                selectHour = hour;
                                bloc.patientTime.text =
                                    '${(hour < 10) ? '0' : ''}${hour.toString()}:00';
                              });
                            },
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
