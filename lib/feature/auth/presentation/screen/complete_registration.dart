import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/message_bar.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/shared/loading_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/widget/align_tilte_widget.dart';
import 'package:se7ety/feature/auth/presentation/widget/doctor_image_widget.dart';
import 'package:se7ety/feature/auth/presentation/widget/drop_specialization_widget.dart';
import 'package:se7ety/feature/auth/presentation/widget/text_form_complete.dart';
import 'package:se7ety/feature/doctor/main/presentation/main_doc_screen.dart';

class CompleteRegistration extends StatelessWidget {
  const CompleteRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TextApp.completeRegistration,
            style: getBodyStyle(
              color: ColorApp.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                LocalStorageApp.saveData("step", "3");
                context.removeUntile(MainDocScreen());
              } else if (state is AuthError) {
                context.pop();
                context.messageBar(state.message);
              } else if (state is AuthLoading) {
                loadingWidget(context);
              }
            },
            builder: (context, state) {
              var bloc = context.read<AuthBloc>();
              return CustomElevatedButtonGlobal(
                onatp: () {
                  bloc.add(CompleteRegisterDoc());
                },
                radius: 10.0.r,
                title: TextApp.register,
              );
            },
          ),
        ),
        body: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 22.0.h),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            var bloc = context.read<AuthBloc>();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DoctorImageWidget(bloc: bloc),
                AlignTilteWidget(title: TextApp.specialization),
                Gap(10.0.h),
                DropSpecializationWidget(
                  controller: bloc.specializtionController,
                ),
                Gap(10.0.h),
                AlignTilteWidget(title: TextApp.introduction),
                Gap(10.0.h),
                TextFormComplete(bloc: bloc),
              ],
            );
          },
        ),
      ),
    );
  }
}
