import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/intro/presentation/screen/welcome_view.dart';
import 'package:se7ety/feature/intro/presentation/widget/explain_app_widget.dart';
import 'package:se7ety/feature/intro/presentation/widget/smooth_indicator_and_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        actions: [
          TextButton(
            onPressed: () {
              context.pushRepalceMent(WelcomeView());
              LocalStorageApp.saveData("step", "1");
            },
            child: Text(
              TextApp.step,
              style: getSmallStyle(color: ColorApp.primery),
            ),
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(10.0), child: CustomBody()),
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  PageController pageController = PageController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ExplainAppWidget(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentindex = value;
              });
            },
          ),
        ),
        SmoothIndicatorAndButton(
          controller: pageController,
          index: currentindex,
          onTapButton: () {
            context.pushRepalceMent(WelcomeView());
            LocalStorageApp.saveData("step", "1");
          },
          onDotClicked: (index) {
            setState(() {
              index = index;
            });
          },
        ),
        Gap(10.0),
      ],
    );
  }
}
