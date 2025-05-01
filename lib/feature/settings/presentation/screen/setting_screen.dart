import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/shared/custom_elevated_button_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/intro/presentation/screen/welcome_view.dart';
import 'package:se7ety/feature/settings/presentation/screen/update_Profile_screen.dart';
import 'package:se7ety/feature/settings/presentation/widget/card_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.setting,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: CustomElevatedButtonGlobal(
          backgroundColor: ColorApp.red,
          onatp: () {
            LocalStorageApp.sharedPreferences.clear();
            context.removeUntile(WelcomeView());
          },
          radius: 10.0.r,
          title: TextApp.logOut,
          width: double.infinity,
        ),
      ),
      body: Column(
        children: [
          CardSetting(
            iconData: Icons.person,
            title: TextApp.settingAccount,
            onTap: () {
              context.push(UpdateProfileScreen());
            },
          ),
          CardSetting(
            iconData: Icons.health_and_safety,
            title: TextApp.password,
          ),
          CardSetting(
            iconData: Icons.notifications_active,
            title: TextApp.notifications,
          ),
          CardSetting(iconData: Icons.safety_check, title: TextApp.speciality),
          CardSetting(
            iconData: Icons.question_mark_rounded,
            title: TextApp.healpAndSupport,
          ),
          CardSetting(
            iconData: Icons.person_add_alt_1,
            title: TextApp.inviteFriend,
          ),
        ],
      ),
    );
  }
}
