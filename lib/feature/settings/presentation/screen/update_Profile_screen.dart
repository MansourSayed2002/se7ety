import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/aletr_dialog.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/profile/data/repo/profile_repo.dart';
import 'package:se7ety/feature/settings/presentation/widget/card_data_profile.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.settingAccount,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ProfileRepo.getProfileData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 100.0.w,
                child: Lottie.asset(ImageApp.loading),
              ),
            );
          }
          return Column(
            children: [
              CardDataProfile(
                text: snapshot.data!.data()!["name"],
                title: TextApp.name,
                onTap: () {
                  context.alertDialod(
                    title: TextApp.enter + TextApp.name,
                    controller: controller,
                    key: "name",
                  );
                },
              ),
              CardDataProfile(
                text: snapshot.data!.data()!["phone"],
                title: TextApp.phone,
                onTap: () {
                  context.alertDialod(
                    title: TextApp.enter + TextApp.phone,
                    controller: controller,
                    key: "phone",
                  );
                },
              ),
              CardDataProfile(
                text: snapshot.data!.data()!["city"],
                title: TextApp.city,
                onTap: () {
                  context.alertDialod(
                    title: TextApp.enter + TextApp.city,
                    controller: controller,
                    key: "city",
                  );
                },
              ),
              CardDataProfile(
                text: snapshot.data!.data()!["bio"],
                title: TextApp.introduction,
                onTap: () {
                  context.alertDialod(
                    title: TextApp.enter + TextApp.introduction,
                    controller: controller,
                    key: "bio",
                  );
                },
              ),
              CardDataProfile(
                text: snapshot.data!.data()!["age"],
                title: TextApp.age,
                onTap: () {
                  context.alertDialod(
                    title: TextApp.enter + TextApp.age,
                    controller: controller,
                    key: "age",
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
