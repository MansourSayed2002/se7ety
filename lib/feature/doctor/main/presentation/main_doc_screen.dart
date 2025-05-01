import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/doctor/appointment/presentation/screen/appointment_doc_screen.dart';
import 'package:se7ety/feature/doctor/profile/presentation/screen/Profile_doctor.dart';

class MainDocScreen extends StatefulWidget {
  const MainDocScreen({super.key});

  @override
  State<MainDocScreen> createState() => _MainDocScreenState();
}

class _MainDocScreenState extends State<MainDocScreen> {
  int currentIndex = 0;
  List<Widget> screen = [AppointmentDocScreen(), ProfileDoctorScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: ColorApp.primery,
        unselectedItemColor: ColorApp.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: TextApp.calender,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: TextApp.myprofile,
          ),
        ],
      ),
      body: screen.elementAt(currentIndex),
    );
  }
}
