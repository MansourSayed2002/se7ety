import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/home/presentation/screen/home_screen.dart';
import 'package:se7ety/feature/my_appointment/presentation/screen/myappointment_screen.dart';
import 'package:se7ety/feature/profile/presentation/screen/profile_screen.dart';
import 'package:se7ety/feature/search/presentation/screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55.0.h,
        child: GNav(
          selectedIndex: currentIndex,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
          tabMargin: EdgeInsets.only(right: 6.0.w, left: 6.0.w, bottom: 6.0.h),
          gap: 8.w,
          iconSize: 24.r,
          haptic: true,
          tabBorderRadius: 15.r,
          curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 100),
          activeColor: ColorApp.white,
          tabBackgroundColor: ColorApp.primery,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: [
            GButton(icon: Icons.home, text: TextApp.home),
            GButton(icon: Icons.search, text: TextApp.search),
            GButton(icon: Icons.calendar_month, text: TextApp.calender),
            GButton(icon: Icons.person, text: TextApp.myprofile),
          ],
        ),
      ),
      body: pages.elementAt(currentIndex),
    );
  }
}
