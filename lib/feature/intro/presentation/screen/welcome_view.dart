import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/enum/type_user.dart';
import 'package:se7ety/core/constants/image_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/feature/auth/presentation/screen/login_view.dart';
import 'package:se7ety/feature/intro/presentation/widget/card_register_widget.dart';
import 'package:se7ety/feature/intro/presentation/widget/text_of_welcome_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.welcome),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              start: 20.0,
              top: 125.0,
              child: TextOfWelcomeWidget(),
            ),
            Positioned(
              bottom: 70.0,
              right: 25.0,
              left: 25.0,
              child: CardRegisterWidget(
                onTapDoctor: () {
                  context.push(LoginView(typeUser: TypeUser.doctor));
                },
                onTapPatient: () {
                  context.push(LoginView(typeUser: TypeUser.patient));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
