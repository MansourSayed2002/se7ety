import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/function/validation.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/widget/align_tilte_widget.dart';
import 'package:se7ety/feature/auth/presentation/widget/working_hour_widget.dart';
import 'package:se7ety/feature/map/presentation/screen/map_screen.dart';

class TextFormComplete extends StatelessWidget {
  const TextFormComplete({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  Widget build(BuildContext context) {
    var keycomplete = GlobalKey<FormState>();
    return Form(
      key: keycomplete,
      child: Column(
        children: [
          CustomTextFromGlobal(
            controller: bloc.introductionController,
            hinttext: TextApp.hintIntroduction,
            height: 200.h,
            maxLines: 200,
            validator: (value) {
              if (keycomplete.currentState!.validate()) {
                return validationField("text", 10, 1000, value);
              }
              return null;
            },
          ),
          Gap(10.0.h),
          Divider(color: ColorApp.grey),
          Gap(10.0.h),
          AlignTilteWidget(title: TextApp.clinicAddress),
          Gap(10.0.h),
          CustomTextFromGlobal(
            controller: bloc.addressController,
            hinttext: TextApp.hintclinicAddress,
            suffixIcon: IconButton(
              onPressed: () {
                context.push(MapScreen());
              },
              icon: Icon(Icons.location_on, color: ColorApp.primery),
            ),
            validator: (value) {
              if (keycomplete.currentState!.validate()) {
                return validationField("numtext", 10, 1000, value);
              }
              return null;
            },
          ),
          Gap(10.0.h),
          Row(
            children: [
              AlignTilteWidget(title: TextApp.workingHoursFrom),
              Gap(45.0.w),
              AlignTilteWidget(title: TextApp.workingHoursTo),
            ],
          ),
          Gap(10.0.h),
          WorkingHourWidget(
            controllerOpen: bloc.opentimeController,
            controllerclose: bloc.closetimeController,
          ),
          Gap(10.0.h),
          AlignTilteWidget(title: TextApp.phone1),
          Gap(10.0.h),
          CustomTextFromGlobal(
            controller: bloc.phone1Controller,
            hinttext: TextApp.hintPhone,
            validator: (value) {
              if (keycomplete.currentState!.validate()) {
                return validationField("phone", 11, 11, value);
              }
              return null;
            },
          ),
          Gap(10.0.h),
          AlignTilteWidget(title: TextApp.phone2),
          Gap(10.0.h),
          CustomTextFromGlobal(
            controller: bloc.phone2Controller,
            hinttext: TextApp.hintPhone,
            validator: (value) {
              if (keycomplete.currentState!.validate()) {
                return validationField("phone", 11, 11, value);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
