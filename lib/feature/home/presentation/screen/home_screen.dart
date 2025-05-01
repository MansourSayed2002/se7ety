import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/class/local_storage_app.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/function/handling_rating.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/home/data/repo/home_repo.dart';
import 'package:se7ety/feature/home/presentation/widget/header_widget.dart';
import 'package:se7ety/feature/home/presentation/widget/search_doc_widget.dart';
import 'package:se7ety/feature/home/presentation/widget/specializatios_widget.dart';
import 'package:se7ety/feature/home/presentation/widget/top_rating_doc_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? documentId;
  @override
  void didChangeDependencies() async {
    documentId = await HomeRepo.checkRating() ?? "";
    handlingRating(documentId.toString(), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        centerTitle: true,
        title: Text(TextApp.myhealth, style: getTitleStyle()),
        actions: [
          IconButton(
            onPressed: () {
              LocalStorageApp.sharedPreferences.clear();
            },
            icon: Icon(Icons.notifications_active, color: ColorApp.black),
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: CustomBody()),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeaderWidget(),
        Gap(20.0.h),
        SearchDocWidget(),
        Gap(20.0.h),
        SpecializatiosWidget(),
        Gap(20.0.h),
        TopRatingDocWidget(),
      ],
    );
  }
}
