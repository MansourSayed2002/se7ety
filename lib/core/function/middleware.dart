import 'package:flutter/material.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/feature/doctor/main/presentation/main_doc_screen.dart';
import 'package:se7ety/feature/intro/presentation/screen/onboarding_view.dart';
import 'package:se7ety/feature/intro/presentation/screen/welcome_view.dart';
import 'package:se7ety/feature/main/presentation/screen/main_screen.dart';

Widget middleWare() {
  if (LocalStorageApp.getData("step") == "1") {
    return WelcomeView();
  } else if (LocalStorageApp.getData("step") == "2") {
    return MainScreen();
  } else if (LocalStorageApp.getData("step") == "3") {
    return MainDocScreen();
  } else {
    return OnboardingView();
  }
}
