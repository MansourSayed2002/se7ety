import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ety/core/constants/text_app.dart';
import 'package:se7ety/core/extensions/navigator_app.dart';
import 'package:se7ety/core/theme/color_app.dart';
import 'package:se7ety/core/theme/textstyle_app.dart';
import 'package:se7ety/feature/search/presentation/screen/search_screen.dart';

class SearchDocWidget extends StatelessWidget {
  const SearchDocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(SearchScreen());
      },
      child: Container(
        padding: EdgeInsets.only(right: 8.0.w, top: 6.0.h, bottom: 6.0.h),
        decoration: BoxDecoration(
          color: ColorApp.third,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TextApp.searchingAboutDoc,
              style: getSmallStyle(fontSize: 15.0.sp),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              decoration: BoxDecoration(
                color: ColorApp.primery,
                borderRadius: BorderRadius.circular(14.0.r),
              ),
              child: Icon(Icons.search, color: ColorApp.white),
            ),
          ],
        ),
      ),
    );
  }
}
