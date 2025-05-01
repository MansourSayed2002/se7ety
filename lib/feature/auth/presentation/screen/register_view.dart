import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/enum/type_user.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/message_bar.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/function/get_type_user.dart';
import 'package:se7ety/core/shared/custom_another_page_global.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/shared/loading_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:se7ety/feature/auth/presentation/screen/complete_registration.dart';
import 'package:se7ety/feature/auth/presentation/screen/login_view.dart';
import 'package:se7ety/feature/auth/presentation/widget/text_form_page.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key, required this.typeUser});
  final TypeUser typeUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: AuthBloc(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    loadingWidget(context);
                  } else if (state is AuthSuccess) {
                    if (typeUser == TypeUser.doctor) {
                      context.pushRepalceMent(CompleteRegistration());
                    } else {
                      LocalStorageApp.saveData("step", "2");
                      context.removeUntile(MainScreen());
                    }
                  } else if (state is AuthError) {
                    context.pop();
                    context.messageBar(state.message);
                  }
                },
                builder: (context, state) {
                  var bloc = context.read<AuthBloc>();
                  return Column(
                    children: [
                      Image.asset(ImageApp.logo, width: 200.w),
                      Gap(15.0.h),
                      Text(
                        "${TextApp.registernow}\"${getTypeUser(typeUser)}\"",
                        style: getBodyStyle(color: ColorApp.primery),
                      ),
                      Gap(15.0.h),
                      TextFormPage(bloc: bloc),
                      Gap(15.0.h),
                      CustomElevatedButtonGlobal(
                        onatp: () {
                          bloc.add(RegisterEvent(typeUser: typeUser));
                        },
                        title: TextApp.createAccount,
                        width: double.infinity,
                      ),
                      Gap(50.0.h),
                      CustomAnotherPageGlobal(
                        ontap: () {
                          context.pushRepalceMent(
                            LoginView(typeUser: typeUser),
                          );
                        },
                        textone: TextApp.haveaccoount,
                        texttwo: TextApp.loginNow,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
