import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/shared/custom_loading_widget.dart';
import 'package:se7ety/core/shared/custom_text_from_global.dart';
import 'package:se7ety/core/shared/doctor_card.dart';
import 'package:se7ety/core/shared/no_data_widget.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/auth/data/model/doctor_model/doctor_model.dart';
import 'package:se7ety/feature/search/data/repo/search_repo.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextApp.searchingAboutDoc,
          style: getBodyStyle(
            color: ColorApp.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomBody(),
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
      child: Column(
        children: [
          CustomTextFromGlobal(
            controller: searchController,
            onChanged: (value) {
              SearchRepo.searchingAboutDoc(value);
              setState(() {});
            },
            hinttext: TextApp.search,
            suffixIcon: Icon(Icons.search, color: ColorApp.primery),
          ),
          Expanded(
            child: StreamBuilder(
              stream: SearchRepo.searchingAboutDoc(searchController.text),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return CustomLoadingWidget();
                }
                return snapshot.data.docs.isNotEmpty
                    ? Scrollbar(
                      child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          var doctors = DoctorModel.formJson(
                            snapshot.data!.docs[index].data(),
                          );
                          return DoctorCard(doctors: doctors);
                        },
                      ),
                    )
                    : NoDataWidget(title: "لا يوجد دكتور بهذا لاسم");
              },
            ),
          ),
        ],
      ),
    );
  }
}
