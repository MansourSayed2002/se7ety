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
import 'package:se7ety/feature/auth/presentation/screen/register_view.dart';
import 'package:se7ety/feature/auth/presentation/widget/text_form_page_log_in.dart';
import 'package:se7ety/feature/doctor/main/presentation/main_doc_screen.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.typeUser});
  final TypeUser typeUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthBloc(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              if (typeUser == TypeUser.doctor) {
                LocalStorageApp.saveData("step", "3");
                context.removeUntile(MainDocScreen());
              } else {
                LocalStorageApp.saveData("step", "2");
                context.removeUntile(MainScreen());
              }
            } else if (state is AuthError) {
              context.pop();
              context.messageBar(state.message);
            } else if (state is AuthLoading) {
              loadingWidget(context);
            }
          },
          builder: (context, state) {
            var bloc = context.read<AuthBloc>();
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.0.w,
                    vertical: 22.0.h,
                  ),
                  child: Column(
                    children: [
                      Image.asset(ImageApp.logo, width: 200.w),
                      Gap(15.0.h),
                      Text(
                        "${TextApp.registernow}\"${getTypeUser(typeUser)}\"",
                        style: getBodyStyle(color: ColorApp.primery),
                      ),
                      Gap(25.0.h),
                      TextFormPageLogIn(bloc: bloc),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            TextApp.forgetPass,
                            style: getSmallStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                      Gap(15.0.h),
                      CustomElevatedButtonGlobal(
                        onatp: () {
                          bloc.add(LoginEvent());
                        },
                        title: TextApp.login,
                        width: double.infinity,
                      ),
                      Gap(50.0.h),
                      CustomAnotherPageGlobal(
                        ontap: () {
                          context.pushRepalceMent(
                            RegisterView(typeUser: typeUser),
                          );
                        },
                        textone: TextApp.noaccount,
                        texttwo: TextApp.registeraccount,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
