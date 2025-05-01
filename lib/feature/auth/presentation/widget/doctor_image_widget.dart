import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/function/image_picker.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';

class DoctorImageWidget extends StatefulWidget {
  const DoctorImageWidget({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  State<DoctorImageWidget> createState() => _DoctorImageWidgetState();
}

class _DoctorImageWidgetState extends State<DoctorImageWidget> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorApp.primery,
      backgroundImage:
          image == null ? AssetImage(ImageApp.doc) : FileImage(File(image!)),
      radius: 60.0.r,
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () async {
            image = await imagePickerGallery();
            widget.bloc.path = image;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorApp.white,
            ),
            child: Icon(Icons.camera_alt, color: ColorApp.primery),
          ),
        ),
      ),
    );
  }
}
