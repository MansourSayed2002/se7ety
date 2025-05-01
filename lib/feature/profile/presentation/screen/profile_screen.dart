import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_loading_widget.dart';
import 'package:se7ety/core/shared/no_data_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/profile/data/repo/profile_repo.dart';
import 'package:se7ety/feature/profile/presentation/widget/connection_info_doc.dart';
import 'package:se7ety/feature/profile/presentation/widget/header_widget.dart';
import 'package:se7ety/feature/profile/presentation/widget/introduction_widget.dart';
import 'package:se7ety/feature/profile/presentation/widget/my_rservation_widget.dart';
import 'package:se7ety/feature/settings/presentation/screen/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
      future: ProfileRepo.getProfileData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomLoadingWidget();
        }
        return snapshot.data!.data()!.isNotEmpty
            ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    image: snapshot.data!.data()!["image"],
                    name: snapshot.data!.data()!["name"],
                    address: snapshot.data!.data()!["city"],
                  ),
                  Gap(20.0.h),
                  IntroductionWidget(
                    introduction: snapshot.data!.data()!["bio"],
                  ),
                  ConnectionInfoDoc(
                    email: snapshot.data!.data()!["email"],
                    phone: snapshot.data!.data()!["phone"],
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
                  MyRservationWidget(),
                ],
              ),
            )
            : NoDataWidget(title: TextApp.noData);
      },
    );
  }
}
