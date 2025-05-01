import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/theme/theme_app.dart';
import 'package:se7ety/feature/intro/presentation/screen/splash_view.dart';

class Se7etyApp extends StatelessWidget {
  const Se7etyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.lightTheme,
          darkTheme: ThemeApp.darkTheme,
          locale: Locale("ar"),
          supportedLocales: [Locale("ar")],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: SplashView(),
        );
      },
    );
  }
}
