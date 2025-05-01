import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/function/validation.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/feature/auth/presentation/bloc/auth_bloc.dart';

class TextFormPageLogIn extends StatefulWidget {
  const TextFormPageLogIn({super.key, required this.bloc});
  final AuthBloc bloc;

  @override
  State<TextFormPageLogIn> createState() => _TextFormPageLogInState();
}

class _TextFormPageLogInState extends State<TextFormPageLogIn> {
  var isVisibility = true;
  var keyLogIn = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyLogIn,
      child: Column(
        children: [
          CustomTextFromGlobal(
            controller: widget.bloc.emailController,
            hinttext: TextApp.hint1,
            hintTextDirection: TextDirection.ltr,
            prefixIcon: Icon(Icons.email, color: ColorApp.primery),
            validator: (value) {
              if (keyLogIn.currentState!.validate()) {
                return validationField("email", 5, 100, value);
              }
              return null;
            },
          ),
          Gap(15.0.h),
          CustomTextFromGlobal(
            controller: widget.bloc.passwordController,
            hintTextDirection: TextDirection.ltr,
            hinttext: TextApp.hint2,
            obscureText: isVisibility,
            prefixIcon: Icon(Icons.lock, color: ColorApp.primery),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisibility = !isVisibility;
                });
              },
              icon: Icon(
                isVisibility ? Icons.visibility_off : Icons.visibility,
                color: ColorApp.primery,
              ),
            ),
            validator: (value) {
              if (keyLogIn.currentState!.validate()) {
                return validationField("numtext", 8, 50, value);
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
